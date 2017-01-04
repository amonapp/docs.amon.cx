<h2 id="plugins-collectd">CollectD Plugins</h2>
<h3>What versions of collectd﻿ are supported?</h3>
<p>
	The native collectd integration supports versions >= 4.10.0 at the moment﻿.
</p>
<h3>Collectd Installation instructions</h3>
<pre ><code class="language-bash"># Install collectd if needed. For Debian-based systems:
$ sudo apt-get update
$ sudo apt-get -y install collectd

# Open collectd.conf for editing

$ sudo vi /etc/collectd/collectd.conf

# Uncomment the line containing "LoadPlugin write_http"

# Then add the following:
&lt;Plugin write_http&gt;
  &lt;URL &quot;http://youramoninstance/api/collectd/server_key&quot;&gt;
    Format &quot;JSON&quot;
  &lt;/URL&gt;
&lt;/Plugin&gt;

# Save and restart collectd
$ sudo service collectd restart</code></pre>
