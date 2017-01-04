## PagerDuty


If you don’t already have a PagerDuty Generic API service, you should create one:

1. In your account, under the Configuration tab, select Services and click **"Add New Service"**.
	<img src="/assets/img/screenshots/pagerduty/pagerduty-add-service.png" alt="">

* Enter a name for the service and select an escalation policy.
	<img src="/assets/img/screenshots/pagerduty/pagerduty-add-service-1.png" alt="">

* Click the **"Add Service"** button.
* Once the service is created, you’ll be taken to the service page. On this page, you’ll see the "Service Integration key", 
	which will be needed when you configure your Amon instance to send events to PagerDuty.
	<img src="/assets/img/screenshots/pagerduty-integration-key.jpg" alt="">

* he next step will be creating a new incident for the Service.
	<img src="/assets/img/screenshots/pagerduty-create-incident.jpg" alt="">


* You will be redirected to the incident page. Copy the **Incident Key**
	<img src="/assets/img/screenshots/pagerduty-incident-key.jpg" alt="">




### In Amon


* In your Amon instance, in Settings, select the **"Notifications"** tab, 
	paste the **Incident Key** and **Integration Key** from Pagerduty and press **'Save'**
	<img src="/assets/img/screenshots/pagerduty-amon.jpg" alt="">
	
