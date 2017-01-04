## Telegraf

<p>Amon is fully compatible with all Telegraf Inputs (<a href="https://github.com/influxdata/telegraf">https://github.com/influxdata/telegraf</a>)
</p>

<h3>Installation</h3>
<p></p>
<ol>
	<li>First install and configure the Telegraf agent and. Test if everything works as expected with  <code class="language-bash">telegraf -test -config /path/to/your/telegraf.conf</code>

	</li>
	<li>Update your config file in <code class='language-bash'>/etc/opt/amonagent/plugins-enabled/telegraf.conf</code></li>
</ol>
<pre ><code class="language-bash">$ echo '{"config": "/path/to/your/telegraf.conf"}' > /etc/opt/amonagent/plugins-enabled/telegraf.conf

$ sudo service amonagent restart (or) sudo systemctl restart amonagent

# Optionally you can test the data collected by the plugin with:
$ /opt/amonagent/amonagent -test-plugin=telegraf
</code></pre>

###  Telegraf Plugin - Config file

<p> The configuration file is just the path to your Telegraf config (it is located at <code class='language-bash'>/etc/opt/amonagent/plugins-enabled/telegraf.conf</code>)</p>


<pre><code class="language-bash">{"config": "/etc/telegraf/telegraf.conf"}</code></pre>

<p>You can see your telegraf plugins on the Servers screen in Amon</p>

<div class="image_wrapper"><img src="/assets/img/screenshots/telegraf.png" alt=""></div>>