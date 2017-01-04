## Health Checks

Amon checks allow you to monitor services or measure resources.


Checks are essentially commands (or scripts) that output data to STDOUT or STDERR and produce an exit status code to indicate a state. Common exit status codes used are 0 for OK, 1 for WARNING, 2 for <code class="language-bash">CRITICAL</code>, and 3 or greater to indicate <code class="language-bash">UNKNOWN</code> or <code class="language-bash">CUSTOM</code>. 


Amon checks use the same specification as Nagios and Sensu, therefore, Nagios and Sensu check plugins may be used with Amon.

### Nagios Checks

Amon is fully compatible with any plugin from the <a href="https://exchange.nagios.org/">Nagios Exchange</a> or the
<a href="https://www.monitoring-plugins.org/index.html">nagios-plugins/monitoring-plugins</a> already available for install in your distro.
To get started on Ubuntu for example, you can do the following:

<pre><code class='language-bash'># Debian based distros
apt-get install nagios-plugins

# On Ubuntu 14.04+
apt-get install monitoring plugins

# All the plugins are installed in /usr/lib/nagios/plugins
/usr/lib/nagios/plugins/check_apt

#APT WARNING: 25 packages available for upgrade (0 critical updates). 
# |available_upgrades=25;;;0 critical_updates=0;;;0

# To add this check, in /etc/opt/amonagent/plugins-enabled/checks.conf
["/usr/lib/nagios/plugins/check_apt"]

service amonagent restart

# To test the output
amonagent -test-plugin=checks
</code></pre>
That is it. You can see the results of your check(s) in Amon
<div class="image_wrapper"><img src="/assets/img/screenshots/health_checks-nagios.png" alt=""></div>
Optionally you can setup alerts on any check and get notified on Slack/Hipchat/Email, etc.


<div class="image_wrapper"><img src="/assets/img/screenshots/health_checks-add-nagios-alerts.png" alt=""></div>

### Sensu Checks

Amon is fully compatible with Sensu checks. You can use any check from <a href="https://github.com/sensu-plugins">https://github.com/sensu-plugins</a>

<div class="image_wrapper"><img src="/assets/img/screenshots/health_checks-sensu-format.png" alt=""></div>


<br>
As an example we are going to use the <a href="https://github.com/sensu-plugins/sensu-plugins-filesystem-checks">https://github.com/sensu-plugins/sensu-plugins-filesystem-checks</a> plugin. 
If you are not familiar with Sensu, the first step would be installing Ruby


<pre><code class='language-bash'># Debian based distros
apt-get install ruby ruby-dev

# Red Hat based distros
yum install ruby ruby-devel

# Install the Sensu plugin
gem install sensu-plugins-filesystem-checks

# All the plugins are installed in /usr/local/bin
check-dir-size.rb  -d /var/lib/mongodb/

# CheckDirSize CRITICAL: Directory /var/lib/mongodb/ is greater than 4,000,000 bytes [actual size: 3,389,005,918 bytes]

# To add this check, in /etc/opt/amonagent/plugins-enabled/checks.conf
["check-dir-size.rb  -d /var/lib/mongodb/"]

# To test the output
amonagent -test-plugin=checks
</code></pre>

That is it. You can see the results of your Sensu check(s) in Amon
<img src="/assets/img/screenshots/health_checks-sensu-alerts.png" alt="">

Optionally you can setup alerts on any check and get notified on Slack/Hipchat/Email, etc.

<img src="/assets/img/screenshots/health_checks-add-sensu-alerts.png" alt="">


### Custom check plugin

The following is an example Amon check plugin. This check uses the running process list to determine if the MySQL process is running. The check is written in Ruby, but you can write checks in Python and Bash.

<pre class='language-ruby'><code>#!/usr/bin/env ruby

# get the current list of processes
processes = `ps aux`

# determine if the chef-client process is running
running = processes.lines.detect do |process|
  process.include?('mysql')
end

# return appropriate check output and exit status code
if running
  puts 'OK - Mysql process is running'
  exit 0
else
  puts 'WARNING - Mysql process is NOT running'
  exit 1
end	
</code></pre>

To enable your custom check

<pre><code class='language-bash'># In /etc/opt/amonagent/plugins-enabled/checks.conf
["ruby|python|bash|perl mysql_running.rb"]

# To test the output
amonagent -test-plugin=checks
</code></pre>

