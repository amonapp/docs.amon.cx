## MySQL

<p>
Monitors MySQL, reporting: parses the output from the SHOW STATUS command
</p>
<ul>
	<li>The output from the SHOW STATUS command <a href="https://dev.mysql.com/doc/refman/5.0/en/show-status.html">https://dev.mysql.com/doc/refman/5.0/en/show-status.html</a>.
	</li>
	<li>Tables and Index Sizes</li>
	<li>Slow Queries</li>
</ul>

<h3>Installation</h3>
<ol>
	<li>First, you have to create an Amon user with replication and select rights:
<pre ><code class="language-bash">$ sudo mysql -e "create user 'amon'@'localhost' identified by 'desired-password';"
$ sudo mysql -e "grant SELECT, REPLICATION CLIENT on *.* to 'amon'@'localhost';"
</code></pre>
	</li>
	<li>
		Enable slow queries logging in <code class='language-bash'>my.cnf</code>

		<pre ><code class="language-bash"># my.cnf within [mysqld] / [mysqld_safe]
slow_query_log = 1
long_query_time = 3
log_output = TABLE
general-log
expire_logs_days = 1
</code></pre>
	</li>
		<li>Update your config file in <code class='language-bash'>/etc/opt/amonagent/plugins-enabled/mysql.conf</code>
		<pre ><code class="language-bash">$ echo '{"host": "username:password@protocol(address)/dbname"}' >
	 /etc/opt/amonagent/plugins-enabled/mysql.conf


$ sudo service amonagent restart (or) sudo systemctl restart amonagent

# Optionally you can test the data collected by the plugin with:
$ /opt/amonagent/amonagent -test-plugin=mysql
</code></pre>
		</li>

</ol>
<h3>MySQL Plugin - Config file</h3>

<p>Below you can see a complete configuration file (located at <code class='language-bash'>/etc/opt/amonagent/plugins-enabled/mysql.conf</code>) with all the options:</p>
<pre><code class="language-bash">{"host": "username:password@protocol(address)/dbname"}</code></pre>
