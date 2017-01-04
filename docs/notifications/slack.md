<h2 id="slack">Slack</h2>

<h3>In Slack:</h3>
<ol>
	<li>From the Slack settings dropdown menu(in the left top corner), click <strong>Configure integrations</strong>, select Incoming webhooks and click <strong>Add</strong>.
		<img src="/assets/img/screenshots/slack-step1.jpg" alt="">
	</li>
	<li>Copy the <strong>Webhook URL</strong>, don't forget to press <strong>Save Settings</strong> at the bottom of the page.
		<img src="/assets/img/screenshots/slack-step2.jpg" alt="">
		
	</li>
</ol>

<h3>In Amon:</h3>
<ol>
	<li>In your Amon instance, in Settings, select the <strong>"Notifications"</strong> tab, 
		paste the Webhook URL from Slack and press <strong>'Save'</strong>
		<img src="/assets/img/screenshots/slack-step3.jpg" alt="">
	</li>

	<li>
		That is it. The next time you Add or Edit your alerts, you can select the Slack checkbox and 
		the next time Amon triggers an alert, it will send the data to Slack
		<img src="/assets/img/screenshots/amon-add-notification.png" alt="">
	</li>
</ol>