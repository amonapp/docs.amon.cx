The amonagent is a single golang binary. There is nothing to install and all dependencies are already bundled in.
To enable a plugin, the only thing you have to do is edit the configuration file in <code class="language-bash">/etc/opt/amonagent/plugins-enabled/{plugin}.conf</code> and restart the agent

<ol>
    <li>To list all available plugins run <code class="language-bash">/opt/amonagent/amonagent -list-plugins</code></li>
    <li>To test a plugin run <code class="language-bash">/opt/amonagent/amonagent -test-plugin={name}</code></li>
    <li>To display all available configuration option for a plugin run <code class="language-bash">/opt/amonagent/amonagent -plugin-config={name}</code></li>
</ol>

## StatsD

{!docs/plugins/statsd.md!}
{!docs/plugins/checks.md!}
{!docs/plugins/apache.md!}
{!docs/plugins/nginx.md!}
{!docs/plugins/mysql.md!}
{!docs/plugins/postgres.md!}
{!docs/plugins/mongodb.md!}
{!docs/plugins/redis.md!}
{!docs/plugins/haproxy.md!}
{!docs/plugins/sensu.md!}
{!docs/plugins/telegraf.md!}
{!docs/plugins/custom.md!}

