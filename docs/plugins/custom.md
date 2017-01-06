## Custom Plugins

ou can create a custom plugin in any language with several lines of code.
The simplest plugin for Amon can be 1 line of code. I am going to use Python as an example:


```
# your-metrics.py
print requests.per_second:10|gauge
```

Add the command that can execute this file in `/etc/opt/amonagent/plugins-enabled/custom.conf`


```
[{ "command":"python /path/to/your-metrics.py", "name":"requests"},]
```

That is it. The agent will execute the command, collect the output from STDOUT, parse it and send the result to Amon. You will see this plugin as `custom.{name}`

```
# Restart the agent
$ sudo service amonagent restart (or) sudo systemctl restart amonagent

# Optionally you can test the data collected by your plugin with:
$ /opt/amonagent/amonagent -test-plugin=custom
```

The agent recognizes the following syntax. Every value has to be on a new line:


```
# Custom Plugin format
chart.line:value|type

# If you want to group multiple values on a single chart:
print "connections.active:10|gauge"
print "connections.waiting:3|gauge"
print "connections.max:40|gauge"

# The agent currently supports two types: gauge and counter
print "connections.active:10|gauge"
print "logged_in_users:50|counter"

# In Python - use print
print "connections.active:10|gauge"

# In Ruby - use puts
puts "connections.active:10|gauge"

# In Bash - use echo or printf
echo "connections.active:10|gauge\n"
printf "connections.active:10|gauge\n"
```

The config file is just a list of commands. You can put as many as you need. All commands are executed in parallel.

```
[{
    "command":"python custom_metrics.py",
    "name":"requests"
},
{
    "command":"python connections.py",
    "name":"connections"
},
{
    "command":"bash response_time.sh",
    "name":"ping.amoncx"
}]
```
### Examples 

A fully functional ping plugin will generate the following chart in Amon

```
curl -s -w 'ping.amoncx.lookup_time:%{time_namelookup}|gauge
ping.amoncx.connect_time:%{time_connect}|gauge
ping.amoncx.total:%{time_total}|gauge\n' -o /dev/null https://www.amon.cx
```

<div class="image_wrapper">
    <img src="/assets/img/screenshots/ping-plugin.png" alt="">
</div>
