<h2 id="plugins-haproxy">Haproxy</h2>
<p>
Collects metrics from HAProxy stats page. This page is not enabled out of the box, and requires modification of HAProxy’s configuration to get it up and running.
</p>
<h3>Configuration</h3>
<p>
To enable the HAProxy stats page, add the following to the bottom of the file <span class="code">/etc/haproxy/haproxy.cfg</span>:

<pre><code class='language-bash'>listen stats
	bind *:1936
	stats enable
	stats uri /
	stats hide-version
</code></pre>
<p>
	Next you’ll need to restart HAProxy, which can interrupt client sessions and cause downtime. If you want to be very careful about how you restart HAProxy, check out <a href="http://engineeringblog.yelp.com/2015/04/true-zero-downtime-haproxy-reloads.html">Yelp’s research</a> on the least disruptive means by which you can reload HAProxy’s configuration.
If you’re comfortable with session interruption, you can restart HAProxy with
<span class="code">sudo service haproxy restart.</span>
<br><br>
After restarting HAProxy with your modified configuration, you can access a stats page like the one below via the URL:  <span class="code">http://YourHAProxyServer:1936</span>
</p>
<div class="image_wrapper">
	<img src="/assets/img/screenshots/haproxy-stats-page.png" alt="">
</div>


<h3>Installation</h3>
<p>Replace with your HAProxy URL parameters and paste in the terminal</p>
<pre ><code class="language-bash">$ echo '{"host": "http://YourHAProxyServer:1936"}' > /etc/opt/amonagent/plugins-enabled/haproxy.conf


$ sudo service amonagent restart (or) sudo systemctl restart amonagent

# Optionally you can test the data collected by the plugin with:
$ /opt/amonagent/amonagent -test-plugin=haproxy
</code></pre>
