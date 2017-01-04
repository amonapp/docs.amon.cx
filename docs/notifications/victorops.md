## VictorOps

<h3>In VictorOps:</h3>
<ol>
	<li>In your account, under the Settings tab, select Integrations and click <strong>REST Endpoint</strong>.
		<img src="/assets/img/screenshots/victorops-restendpoint.png" alt="">
	</li>
</ol>
<h3>In Amon:</h3>
<ol>
	<li>In your Amon instance, in Settings, select the <strong>"Notifications"</strong> tab, 
		paste the Key from VictorOps, replace <strong>$routing_key</strong> with <strong>amon</strong>  and press <strong>'Save'</strong>
		<img src="/assets/img/screenshots/amon-victorops.png" alt="">
	</li>
	<li>
		That is it. The next time you Add or Edit your alerts, you can select the VictorOps checkbox and 
		the next time Amon triggers an alert, it will send the data to VictorOps
		<img src="/assets/img/screenshots/amon-add-notification.png" alt="">
	</li>
</ol>
<h2 id="opsgenie">OpsGenie</h2>
<h3>In OpsGenie:</h3>
<ol>
	<li>In your account, under the Integrations tab, click <strong>API</strong>.
		<img src="/assets/img/screenshots/opsgenie-api-key.png" alt="">
	</li>
	<li>In the API tab, click <strong>Save Integration</strong>.
		<img src="/assets/img/screenshots/opsgenie-save-integration.png" alt="">
	</li>
</ol>
<h3>In Amon:</h3>
<ol>
	<li>In your Amon instance, in Settings, select the <strong>"Notifications"</strong> tab, 
		paste the Key from OpsGenie and press <strong>'Save'</strong>
		<img src="/assets/img/screenshots/amon-opsgenie.png" alt="">
	</li>
</ol>