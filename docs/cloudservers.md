## Amazon EC2 

<p>
With Amon's EC2 integration you can automatically sync the information about your EC2 instances directly from Amazon, instead of manually adding them
one by one from the Amon Dasbhoard.
</p>


* On your Amazon Dashboard, click on **"Identify & Access Management"**
		<img src="/assets/img/screenshots/amazon-step-1.png" alt="">
* Click on **Group**, **Create New Group**
	<img src="/assets/img/screenshots/amazon-step-2.png" alt="">
* Enter a name for the group
	<img src="/assets/img/screenshots/amazon-step-3.png" alt="">
* Select Group Policies for the Group, Amon requires only **AmazonEC2ReadOnlyAccess**
	<img src="/assets/img/screenshots/amazon-step-4.png" alt="">
* The next step is to create a new user
	<img src="/assets/img/screenshots/amazon-step-5.png" alt="">
	<img src="/assets/img/screenshots/amazon-step-6.png" alt="">
* Don't forget to copy or Download your user credentials
	<img src="/assets/img/screenshots/amazon-step-7.png" alt="">
	
* The final step would be adding the newly created user to our Group
	<img src="/assets/img/screenshots/amazon-step-8.png" alt="">

<h3>In Amon:</h3>
* Navigate to the **Servers** tab, click **Cloud servers** and select **Amazon**,
  paste your **Access Key ID** and **Secret Access Key** and click **Sync** 
  <img src="/assets/img/screenshots/amon-amazon.png" alt="">

## DigitalOcean
<p>
With Amon's DigitalOcean integration you can automatically sync the information about your Droplets instances directly from DigitalOcean, instead of manually adding them
one by one from the Amon Dasbhoard.
</p>
<h3>In DigitalOcean:</h3>
* In your DigitalOcean dashboard, click **API** 
	<img src="/assets/img/screenshots/digitalocean-step-1.jpg" alt="">
* Generate a new **Read only token**

<h3>In Amon:</h3>
* Navigate to the **Servers** tab, click **Cloud servers** and select **DigitalOcean**,
	paste your **DigitalOcean token** and click **Sync** 
		<img src="/assets/img/screenshots/amon-digitalocean.png" alt="">




## Google Compute Cloud

With Amon's Google Compute Cloud integration you can automatically sync the information about your next-gen servers into Amon


* Click on **Apis & Auth**. 
	<img src="/assets/img/screenshots/google-step-1.jpg" alt="">
* Click on **Create new client ID**, **Service Account** 
	<img src="/assets/img/screenshots/google-step-2.jpg" alt="">

<h3>In Amon:</h3>

* Navigate to the **Servers** tab, click **Cloud servers** and select **Google Compute**,
	paste your **Service account email address**, **Your project ID from the first screenshot** 
	and upload your **JSON key**. Finally click Sync
		<img src="/assets/img/screenshots/amon-google.jpg" alt="">


## Rackspace

With Amon's Rackspace integration you can automatically sync the information about your next-gen servers into Amon

* Click on **Account**, **Account Settings**, copy your API Key
  <img src="/assets/img/screenshots/rackspace-api-key.png" alt="">

<h3>In Amon:</h3>

* Navigate to the **Servers** tab, click **Cloud servers** and select **Rackspace**,
	paste your **API Key** and click **Sync** 
	<img src="/assets/img/screenshots/amon-rackspace.png" alt="">


## Linode

With Amon's Linode integration you can automatically sync the information about your Linode servers , instead of manually adding them
one by one from the Amon Dasbhoard.

* Click on **my profile**, click **API Keys ** and create a new API Key
  <img src="/assets/img/screenshots/linode-api-key.png" alt="">

<h3>In Amon:</h3>

* Navigate to the **Servers** tab, click **Cloud servers** and select **Linode**,
  paste your **API Key ID** and click **Sync** 
  <img src="/assets/img/screenshots/amon-linode.png" alt="">

