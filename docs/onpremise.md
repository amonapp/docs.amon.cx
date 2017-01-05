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

chown -R current_user:user_group /opt/amon
chown -R current_user:user_group /etc/opt/amon

git clone https://github.com/amonapp/amon.git /opt/amon
```

### Setting up an Environment

Next you will need to setup a Python environment for the Amon dependecies. Choose a location for the environment and create it with the following command. For out guide, we are goind to choose `/opt/amon/env/`

```
python3 -m venv /opt/amon/env/

# Activate the environment
source /opt/amon/env/bin/activate
pip install -r /opt/amon/requirements.txt
```


## Configuration

!!! note
    Before this step, please make sure that you have MongoDB 3.2+ running. The default version shipped in Ubuntu 16.04LTS is 2.6 which is not compatible with Amon.

Next we move to actually configuring and running Amon. We start by creating the configuration directory for Amon:

```
touch /etc/opt/amon/amon.yml
```



## High Availability Deployment