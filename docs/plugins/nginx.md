<h2 id="plugins-nginx">Nginx</h2>
<p>
Monitors Nginx, sends to Amon the the following metrics:
</p>
<ul>
	<li>Connections - reading, writing, waiting</li>
	<li>Requests per second</li>
</ul>


<h3>Installation</h3>
<ol>
	<li>Enable the <span class="code">HttpStubStatusModule</span> -
<a href="http://wiki.nginx.org/HttpStubStatusModule">http://wiki.nginx.org/HttpStubStatusModule</a> in your Nginx configuration files</li>

	<li>Finally update your config file in <code class='language-bash'>/etc/opt/amonagent/plugins-enabled/nginx.conf</code></li>
</ol>
<pre ><code class="language-bash">$ echo '{"status_url": "http://localhost/nginx_status"}' >
	 /etc/opt/amonagent/plugins-enabled/nginx.conf


$ sudo service amonagent restart (or) sudo systemctl restart amonagent

# Optionally you can test the data collected by the plugin with:
$ /opt/amonagent/amonagent -test-plugin=nginx
</code></pre>
<h3>Nginx Plugin - Config file</h3>

<p>Below you can see a complete configuration file (located at <code class='language-bash'>/etc/opt/amonagent/plugins-enabled/nginx.conf</code>) with all the options:</p>
<pre><code class="language-bash">{"status_url": "http://localhost/nginx_status"}
</code></pre>
