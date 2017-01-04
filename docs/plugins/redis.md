<h2 id="plugins-redis">Redis</h2>
<p>
Monitors Redis parsing the output from the <span class="code">INFO</span> command -
<a href="http://redis.io/commands/INFO">http://redis.io/commands/INFO</a>.
</p>

<h3>Installation</h3>
<p>Replace with your Redis connection parameters and paste in the terminal</p>
<pre ><code class="language-bash">$ echo '{"host": "tcp://localhost:6379"}' > /etc/opt/amonagent/plugins-enabled/redis.conf


$ sudo service amonagent restart (or) sudo systemctl restart amonagent

# Optionally you can test the data collected by the plugin with:
$ /opt/amonagent/amonagent -test-plugin=redis
</code></pre>
