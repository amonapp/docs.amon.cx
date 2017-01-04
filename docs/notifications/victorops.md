## VictorOps

1. In your account, under the Settings tab, select Integrations and click **REST Endpoint**.
	<img src="/assets/img/screenshots/victorops-restendpoint.png" alt="">


### In Amon

1. In your Amon instance, in Settings, select the **"Notifications"** tab, 
		paste the Key from VictorOps, replace **$routing_key** with **amon**  and press **'Save'**
		<img src="/assets/img/screenshots/amon-victorops.png" alt="">

	* That is it. The next time you Add or Edit your alerts, you can select the VictorOps checkbox and 
		the next time Amon triggers an alert, it will send the data to VictorOps
		<img src="/assets/img/screenshots/amon-add-notification.png" alt="">

