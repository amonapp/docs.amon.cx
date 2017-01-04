<h2 id="plugins-sensu">Sensu</h2>
<p>Amon is fully compatible with all Sensu Plugins (<a href="https://github.com/sensu-plugins">https://github.com/sensu-plugins</a>)
</p>

<h3>Installation</h3>
<p></p>
<ol>
	<li>First install your desired Sensu Plugin. I am going to use the <code class="language-bash">sensu-plugins-io-checks</code> as an example. (<a href="https://github.com/sensu-plugins/sensu-plugins-io-checks">https://github.com/sensu-plugins/sensu-plugins-io-checks</a>)
    <pre ><code class="language-bash">apt-get install ruby ruby-dev
gem install sensu-plugins-io-checks

# Test the plugin
metrics-iostat-extended.rb</code></pre>
	</li>
	<li>Update your config file in <code class='language-bash'>/etc/opt/amonagent/plugins-enabled/sensu.conf</code></li>
</ol>
<pre ><code class="language-bash">$ echo '["metrics-iostat-extended.rb"]' > /etc/opt/amonagent/plugins-enabled/sensu.conf

$ sudo service amonagent restart (or) sudo systemctl restart amonagent

# Optionally you can test the data collected by the plugin with:
$ /opt/amonagent/amonagent -test-plugin=sensu
</code></pre>
<h3>Sensu Plugin - Config file</h3>

<p> The configuration file is just a list with all the sensu plugins you want to execute(it is located at <code class='language-bash'>/etc/opt/amonagent/plugins-enabled/sensu.conf</code>) with all the options:</p>
<pre><code class="language-bash">[
    "metrics-iostat-extended.rb",
    "metrics-redis-graphite.rb"
]
</code></pre>
