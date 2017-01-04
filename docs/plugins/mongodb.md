## MongoDB

<p>Sends to Amon the the following metrics: </p>
<ul>
	<li>Collection and Index sizes</li>
	<li>Slow Queries</li>
	<li>Connections -
	<a href="http://docs.mongodb.org/manual/reference/command/serverStatus/#connections">
	http://docs.mongodb.org/manual/reference/command/serverStatus/#connections</a></li>

	<li>Opcounters -
	<a href="http://docs.mongodb.org/manual/reference/command/serverStatus/#opcounters">
	http://docs.mongodb.org/manual/reference/command/serverStatus/#opcounters</a></li>

	<li>Cursors -
	<a href="http://docs.mongodb.org/manual/reference/command/serverStatus/#cursors">
	http://docs.mongodb.org/manual/reference/command/serverStatus/#cursors</a></li>

	<li>IndexCounters -
	<a href="http://docs.mongodb.org/manual/reference/command/serverStatus/#indexcounters">
	http://docs.mongodb.org/manual/reference/command/serverStatus/#indexcounters</a></li>

	<li>Asserts -
	<a href="http://docs.mongodb.org/manual/reference/command/serverStatus/#asserts">
	http://docs.mongodb.org/manual/reference/command/serverStatus/#asserts</a></li>

	<li>Metrics -
	<a href="http://docs.mongodb.org/manual/reference/command/serverStatus/#metrics">
	http://docs.mongodb.org/manual/reference/command/serverStatus/#metrics</a></li>

</ul>
<h3>Installation</h3>
<pre ><code class="language-bash">
$ echo '{"uri": "mongodb://username:password@host:port/database"}' >
	/etc/opt/amonagent/plugins-enabled/mongodb.conf

$ sudo service amonagent restart (or) sudo systemctl restart amonagent

# Optionally you can test the data collected by the plugin with:
$ /opt/amonagent/amonagent -test-plugin=mongodb
</code></pre>


<h3>Configuration</h3>
<p>If you have enabled authentication for your Mongo database, you have to create a read only admin user for Amon:</p>
<pre ><code class="language-bash">$ mongo
$ use admin
$ db.auth("admin", "admin-password")
$ db.addUser("amon", "your-desired-password", true)</code></pre>



<h3>MongoDB Plugin - Config file</h3>

<p>Below you can see a complete configuration file (located at <code class='language-bash'>/etc/opt/amonagent/plugins-enabled/mongodb.conf</code>) with all the options:</p>
<pre><code class="language-bash">{"uri": "mongodb://username:password@host:port/database"}</code></pre>
