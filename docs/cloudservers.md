<section id="integrations">



<h2 id="integrations-amazon">Amazon EC2</h2>
<p>
With Amon's EC2 integration you can automatically sync the information about your EC2 instances directly from Amazon, instead of manually adding them
one by one from the Amon Dasbhoard.
</p>
<h3>In Amazon: </h3>
<ol>
	<li>
		On your Amazon Dashboard, click on <strong>"Identify & Access Management"</strong>
		<img src="/assets/img/screenshots/amazon-step-1.png" alt="">
	</li>
	<li>
		Click on <strong>Group</strong>, <strong>Create New Group</strong>
		<img src="/assets/img/screenshots/amazon-step-2.png" alt="">
	</li>
	<li>
		Enter a name for the group
		<img src="/assets/img/screenshots/amazon-step-3.png" alt="">
	</li>
	<li>
		Select Group Policies for the Group, Amon requires only <strong>AmazonEC2ReadOnlyAccess</strong>
		<img src="/assets/img/screenshots/amazon-step-4.png" alt="">
	</li>
	<li>
		The next step is to create a new user
		<img src="/assets/img/screenshots/amazon-step-5.png" alt="">
		<img src="/assets/img/screenshots/amazon-step-6.png" alt="">
	</li>
	<li>
		Don't forget to copy or Download your user credentials
		<img src="/assets/img/screenshots/amazon-step-7.png" alt="">
		
	</li>
	<li>
		The final step would be adding the newly created user to our Group
		<img src="/assets/img/screenshots/amazon-step-8.png" alt="">
	</li>
</ol>
<h3>In Amon:</h3>
<ol>
	<li>Navigate to the <strong>Servers</strong> tab, click <strong>Cloud servers</strong> and select <strong>Amazon</strong>,
	paste your <strong>Access Key ID</strong> and <strong>Secret Access Key</strong> and click <strong>Sync</strong> 
	<img src="/assets/img/screenshots/amon-amazon.png" alt="">
	</li>
</ol>
<h2 id="integrations-digitalocean">DigitalOcean</h2>
<p>
With Amon's DigitalOcean integration you can automatically sync the information about your Droplets instances directly from DigitalOcean, instead of manually adding them
one by one from the Amon Dasbhoard.
</p>
<h3>In DigitalOcean:</h3>
<ol>
	<li>In your DigitalOcean dashboard, click <strong>API</strong> 
		<img src="/assets/img/screenshots/digitalocean-step-1.jpg" alt="">
	</li>
	<li>Generate a new <strong>Read only token</strong></li>
</ol>
<h3>In Amon:</h3>
<ol>
	<li>Navigate to the <strong>Servers</strong> tab, click <strong>Cloud servers</strong> and select <strong>DigitalOcean</strong>,
	paste your <strong>DigitalOcean token</strong> and click <strong>Sync</strong> 
		<img src="/assets/img/screenshots/amon-digitalocean.png" alt="">
	</li>
</ol>



<h2 id="integrations-google">Google Compute Cloud</h2>
<p>
With Amon's Google Compute Cloud integration you can automatically sync the information about your next-gen servers into Amon
<h3>In Google Compute:</h3>
<ol>
	<li>
		Click on <strong>Apis & Auth</strong>. 
		<img src="/assets/img/screenshots/google-step-1.jpg" alt="">
	</li>
	<li>
		Click on <strong>Create new client ID</strong>, <strong>Service Account</strong> 
		<img src="/assets/img/screenshots/google-step-2.jpg" alt="">
	</li>
</ol>
<h3>In Amon:</h3>
<ol>
	<li>Navigate to the <strong>Servers</strong> tab, click <strong>Cloud servers</strong> and select <strong>Google Compute</strong>,
	paste your <strong>Service account email address</strong>, <strong>Your project ID from the first screenshot</strong> 
	and upload your <strong>JSON key</strong>. Finally click Sync
		<img src="/assets/img/screenshots/amon-google.jpg" alt="">
	</li>
</ol>

<h2 id="integrations-rackspace">Rackspace</h2>
<p>
With Amon's Rackspace integration you can automatically sync the information about your next-gen servers into Amon
<h3>In Rackspace:</h3>
<ol>
	<li>
		Click on <strong>Account</strong>, <strong>Account Settings</strong>, copy your API Key
		<img src="/assets/img/screenshots/rackspace-api-key.png" alt="">
	</li>
</ol>
<h3>In Amon:</h3>
<ol>
	<li>Navigate to the <strong>Servers</strong> tab, click <strong>Cloud servers</strong> and select <strong>Rackspace</strong>,
	paste your <strong>API Key</strong> and click <strong>Sync</strong> 
		<img src="/assets/img/screenshots/amon-rackspace.png" alt="">
	</li>
</ol>

<h2 id="integrations-linode">Linode</h2>
<p>
With Amon's Linode integration you can automatically sync the information about your Linode servers , instead of manually adding them
one by one from the Amon Dasbhoard.
</p>
<h3>In Linode:</h3>
<ol>
	<li>Click on <strong>my profile</strong>, click <strong>API Keys </strong> and create a new API Key
		<img src="/assets/img/screenshots/linode-api-key.png" alt="">
	</li>
</ol>
<h3>In Amon:</h3>
<ol>
	<li>Navigate to the <strong>Servers</strong> tab, click <strong>Cloud servers</strong> and select <strong>Linode</strong>,
	paste your <strong>API Key ID</strong> and click <strong>Sync</strong> 
		<img src="/assets/img/screenshots/amon-linode.png" alt="">
	</li>
</ol>
</section>
