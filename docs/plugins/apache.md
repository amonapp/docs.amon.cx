## Apache
<p>
Monitors Apache, reporting:
</p>
<ul>
	<li>
		Idle, Busy workers
	</li>
	<li>Requests per second</li>
	<li>Total accesses/bytes</li>
</ul>

<h3>Installation</h3>

<ol>
	<li>
		Enable <span class="code">mod_status</span> in your apache configuration. You can see a tutorial
<a href="http://www.cyberciti.biz/faq/apache-server-status">http://www.cyberciti.biz/faq/apache-server-status</a>
Replace with your apache status url and paste in the terminal
	</li>
	<li>Update your config file in <code class='language-bash'>/etc/opt/amonagent/plugins-enabled/apache.conf</code></li>
</ol>
<pre ><code class="language-bash">$ echo '{"status_url": "http://localhost/server-status?auto"}' >
	 /etc/opt/amonagent/plugins-enabled/apache.conf


$ sudo service amonagent restart (or) sudo systemctl restart amonagent

# Optionally you can test the data collected by the plugin with:
$ /opt/amonagent/amonagent -test-plugin=apache
</code></pre>
<h3>Apache Plugin - Config file</h3>

<p>Below you can see a complete configuration file (located at <code class='language-bash'>/etc/opt/amonagent/plugins-enabled/apache.conf</code>) with all the options:</p>
<pre><code class="language-bash">{
    "status_url": "http://localhost/server-status?auto",
}
</code></pre>
