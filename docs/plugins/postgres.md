## PostgreSQL

<p>
Monitors PostgreSQL, sends to Amon the the following metrics:
</p>
<ul>
	<li>Database size</li>
	<li>Table and Index sizes</li>
	<li>Slow Queries</li>
	<li>Missing Indexes</li>
	<li>Index Hit Rate</li>
	<li>pg_stats_database Metrics</li>
</ul>


<h3>Installation</h3>
<ol>
	<li>
		Create a read-only amon user with proper access to your PostgreSQL Server
<pre ><code class="language-bash">$ psql
$ create user amon with password 'your-desired-password';
$ grant SELECT ON pg_stat_database to amon;
</code></pre>
	</li>
	<li>Install **postgresql-contrib** and enable the **pg_stat_statements** extension
<pre ><code class="language-bash">$ sudo yum/apt-get install postgresql-contrib
$ sudo -u postgres psql
$ CREATE EXTENSION pg_stat_statements;
</code></pre></li>
<li>Finally update your config file in <code class='language-bash'>/etc/amonagent/plugins-enabled/postgres.conf</code>

		<pre ><code class="language-bash">$ echo '{"host": "postgres://user:password@localhost:port/dbname"}' >
	 /etc/opt/amonagent/plugins-enabled/postgresql.conf


$ sudo service amonagent restart (or) sudo systemctl restart amonagent

# Optionally you can test the data collected by the plugin with:
$ /opt/amonagent/amonagent -test-plugin=postgresql
</code></pre>
		</li>
</ol>

<h3>PostgreSQL Plugin - Config file</h3>

<p>Below you can see a complete configuration file (located at <code class='language-bash'>/etc/opt/amonagent/plugins-enabled/postgres.conf</code>) with all the options:</p>
<pre><code class="language-bash">{"host": "postgres://user:password@localhost:port/dbname"}
</code></pre>
