<h2>Webhooks</h2>
<p>Starting with version 3.3 Amon supports Webhooks, which make it easy for
 you to integrate more sophisticated alerting platforms like PagerDuty, VictorOps.

<br><br>
To create a webhook, go to Settings/Webhooks and set an URL. For additional protection,
 you can set a secret passphrase which is going to be sent with the request.</p>

<pre><code class="language-python">
{
	"trigger": {"to": 1428223320, "from": 1428223286, "average_value": 63.0}, 
	"alert": {"rule_type": "global", 
		"metric_value": 5, 
		"metric": "Disk", 
		"period": 30, 
		"metric_type": "%", 
		"above_below": "above"
	}, 
	"server": {"name": "local"}
	"process": {"name": "ruby"}
	"secret": "secretpass"
}
</code></pre>