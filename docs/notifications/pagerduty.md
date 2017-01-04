## PagerDuty

<h3>In PagerDuty:</h3>
<p>If you don’t already have a PagerDuty Generic API service, you should create one:</p>
<ol>
	<li>In your account, under the Configuration tab, select Services and click <strong>"Add New Service"</strong>.
		<img src="/assets/img/screenshots/pagerduty/pagerduty-add-service.png" alt="">
	</li>
	<li>
		Enter a name for the service and select an escalation policy.
		<img src="/assets/img/screenshots/pagerduty/pagerduty-add-service-1.png" alt="">
	</li>
	<li>Click the <strong>"Add Service"</strong> button.</li>
	<li>
		Once the service is created, you’ll be taken to the service page. On this page, you’ll see the "Service Integration key", 
		which will be needed when you configure your Amon instance to send events to PagerDuty.
		<img src="/assets/img/screenshots/pagerduty-integration-key.jpg" alt="">
	</li>
	<li>
		The next step will be creating a new incident for the Service.
		<img src="/assets/img/screenshots/pagerduty-create-incident.jpg" alt="">
	</li>

	<li>
		You will be redirected to the incident page. Copy the <strong>Incident Key</strong>
		<img src="/assets/img/screenshots/pagerduty-incident-key.jpg" alt="">
	</li>
</ol>
<h3>In Amon:</h3>
<ol>
	<li>
		In your Amon instance, in Settings, select the <strong>"Notifications"</strong> tab, 
		paste the <strong>Incident Key</strong> and <strong>Integration Key</strong> from Pagerduty and press <strong>'Save'</strong>
		<img src="/assets/img/screenshots/pagerduty-amon.jpg" alt="">
	</li>
</ol>