The Amon Server is the core Python application that powers all of <a href="https://www.amon.cx/pricing/">our hosted Amon</a> installations. This covers everything related to getting it running on your own infrastructure.

## Hardware Requirements

Amon is a Django application, which stores all performance data in a MongoDB database. The absolute minimum requirement to run Amon on your infrastructure is a server with at least:

* 2GB of RAM, 4GB or More if you plan to monitor more then 20 machines
* 50GB SSD - On average storing data for 1 server with the default 30 days retention takes around 500MB of disk space
* A dedicated (sub)domain to host Amon on (i.e. monitoring.yourcompany.com).


## Service Requirements

Before running Amon itself, there are a few minimum services that you have to install

* MongoDB 3.2+ - _Amon stores all performance data in a MongoDB 3.4+ database, ideally with the WiredTiger storage engine and the snappy compression enabled. You can install MongoDB, following these <a href="https://docs.mongodb.com/manual/installation/">instructions</a>. Enabling <a href="https://docs.mongodb.com/manual/tutorial/enable-authentication/">auth</a> for MongoDB is highly recommended_
* Nginx - _Nginx servers the static files and secures your Amon instance. It is highly recommended that you run your Amon instance behind SSL - with your own certificate or you can generate one for free with <a href="https://letsencrypt.org">Let's Encrypt</a>._
* Python 3.5 - _You can install it on your favorite distro, following the official instructions from the <a href="https://www.python.org">Python</a> website, or deploy Amon on Ubuntu 16.04, which has Python 3.5 preinstalled._


## Installation

Some basic prerequisites which you’ll need in order to run Amon:

* Linux distro. We test on Ubuntu 16.04LTS and this documentation assumes an Ubuntu/Debian based system.
* python3-pip, python3-dev, python3-venv, gcc, libyaml-dev, libev-dev, git
* Python 3.5+





### Getting Amon

First you need to get Amon from Github

```
# Install all required dependecies 
sudo apt install python3-pip python3-dev python3-venv gcc libyaml-dev libev-dev git

# Create the directories where you are going to store the configs, logs and Amon itself
mkdir -p /opt/amon
mkdir -p /var/log/amon
mkdir -p /etc/opt/amon

# Create the amon user
useradd --system --user-group --key USERGROUPS_ENAB=yes -M amon --shell /bin/false -d /etc/opt/amon

chown -R amon:amon /opt/amon
chown -R amon:amon /etc/opt/amon
chown -R amon:amon /var/log/amon

git clone https://github.com/amonapp/amon.git /opt/amon
```

### Setting up an Environment

Next you will need to setup a Python environment for the Amon dependecies. Choose a location for the environment and create it with the following command. For out guide, we are goind to choose `/opt/amon/env/`

```
python3 -m venv /opt/amon/env/

# Activate the environment
source /opt/amon/env/bin/activate
pip install -r /opt/amon/requirements.txt

# Create the database and check if Amon is running
touch /etc/opt/amon/amon.yml
cd /opt/amon
python manage.py migrate 

python manage.py installtasks  # Alert sending / Cloud Sync / Agent no data sent cron tasks

# To test if Amon is configured properly
python manage.py runserver
```

## Running Amon as a Service

We recommend using whatever software you are most familiar with for managing Amon.

For Debian, Ubuntu and other operating systems relying on systemd, you can follow the examples in this section.

Configuring systemd requires 1 file. On Ubuntu 16.04, the files will be located in `/etc/systemd/system`. Create a file named `amon.service` with the contents listed below.

To ensure that the service start up on reboots, run the following command: `systemctl enable amon.service`.


```
[Unit]
Description=Amon
After=network.target

[Service]
Type=simple
User=amon
Group=amon
WorkingDirectory=/opt/amon/
ExecStart=/opt/amon/env/bin/gunicorn wsgi -c /opt/amon/gunicorn.conf

[Install]
WantedBy=multi-user.target
```


## Configuration

!!! note
    Before this step, please make sure that you have MongoDB 3.2+ running. The default version shipped in Ubuntu 16.04LTS is 2.6 which is not compatible with Amon.

Next we move to actually configuring and running Amon. Configuring Amon requires 1 file located in `/etc/amon/amon.yml`. The file should have the following minimum contents. The SMTP settings are just an example, you can setup Amon to work with your prefered SMTP provider

```yaml
host: https://amon.yourdomain.com
smtp:
  host: smtp.mailgun.org 
  port: 587
  username: amon_alerts
  password: *********
  use_tls: true
  sent_from: alerts@yourdomain.com
```


## Proxying with Nginx

Nginx is a requirement for Amon - we are using it to provide SSL configuration and to server the static files. To get started, install the `nginx-full` module.


Below is a sample production ready configuration for Nginx with Amon:


```nginx
worker_processes 4;
user nobody nogroup;

events {
	worker_connections 1024;
	accept_mutex off;
}

http {
	include mime.types;
	default_type application/octet-stream;
	access_log off;
	rewrite_log on;
	sendfile on;
	tcp_nopush on;
	tcp_nodelay on;
	keepalive_timeout 15;
	types_hash_max_size 2048;
	server_names_hash_bucket_size 64;
	client_max_body_size 4G;


	error_log /var/log/nginx.error.log ;
	access_log /var/log/nginx.access.log;

	upstream app_server {
		server 127.0.0.1:9000 fail_timeout=15;
	}


	ssl_certificate   /etc/nginx/ssl/wildcard_yourdomain_com_bundle.cer;
	ssl_certificate_key /etc/nginx/ssl/wildcard_yourdomain_com.key;
	ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
	ssl_ciphers 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA';
	
	 # Add perfect forward secrecy
	ssl_prefer_server_ciphers on;

	ssl_dhparam /etc/nginx/ssl/dhparams.pem;

	 # Add HSTS
	add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

	server {
		listen 80;
  		server_name amon.yourdomain.com;
  		return 301 https://amon.yourdomain.com$request_uri;
	}

	server {
		listen 443 ssl;
		listen [::]:443 ipv6only=on;
		server_name  amon.yourdomain.com;
		
		location / {
			proxy_read_timeout 30s;
			proxy_buffering    off;
			proxy_pass         http://app_server;
			proxy_redirect     off;
			proxy_set_header   Host $http_host;
			proxy_set_header   X-Real-IP        $remote_addr;
			proxy_set_header   X-Forwarded-For  $proxy_add_x_forwarded_for;
			proxy_set_header   X-Forwarded-Protocol ssl;
	  }

	}

}

```



## High Availability Deployment


Amon scales quite well horizontally, however there is still a primary single point of failure at the database level. 

In an HA setup, it is critical that you have a MongoDB setup with at least 1 master and 2 replicas, as defined <a href="https://docs.mongodb.com/manual/replication/">here</a>

The other point of failure could be the alert sending mechanism - if you send a lot of alert emails via SMTP in short periods of time. In this case you should consider switching to one of the other notification providers like VictorOps or PagerDuty. 

