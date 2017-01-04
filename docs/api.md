<p>Any tool that is fluent in HTTP can communicate with the API simply by requesting the correct URI. 
The interface responds to different methods depending on the action required.</p>

## Servers

### List Servers

```javascript
// Request
GET https://youramoninstance/api/v1/servers/list/?api_key=apikey

// Response
{
	"status": 200, 
	"servers": [
		{
			"provider": "digitalocean", 
			"name": "mongodb", 
			"key": "tpd8r7bmzl35eb0h88z3cm7mkrwoymgu", 
			"last_check": null,
            "id": "5550cc56c42f5f8a3986697e"
		}, 
		{
			"provider": null,
			"name": "django", 
			"key": "hkjaa3mi57wkc3qlazqokjpyecjfkbit", 
			"last_check": 1433944675,
            "id": "5575d5c51d41c80eeb980c58"
		}, 
		{
			"provider": "amazon", 
			"name": "redisdb-slave", 
			"key": "o5p5z8twrmv5mp93ewe8gl4d3y6dwlic", 
			"last_check": 1428222753,
            "id": "5550cc601d41c83b0b510fc6"
}

```

### Create Server

```javascript
// Request - will create a server and generate a random name
GET https://youramoninstance/api/v1/servers/create/?api_key=apikey

 Response
{
    "status": 200, 
    "name": "weathered-voice-23661", 
    "key": "wvskx5emjft6we3lm07f9uqya4f05s5v"
}

// Request - will create a server and generate a random name
POST https://youramoninstance/api/v1/servers/create/?api_key=apikey

// Request headers
Content-Type: application/json

// Request content 
// tags - optional, Syntax: group:tag or tag
{
    "name": "yourservername", 
    "tags": ["role:db"]
}

// Response
{
    "status": 200, 
    "name": "yourservername", 
    "key": "wvskx5emjft6we3lm07f9uqya4f05s5v"
}


// Request content with server key
// Randomly generated 32 characters long alpha numeric, lowercase string
// tags - optional, Syntax: group:tag or tag
{  
    "name": "yourservername", 
    'key': 'wvskx5emjft6we3lm07f9uqya4f05s5v', 
    "tags": ["role:db"]
}

// Response
{
    "status": 200, 
    "name": "yourservername", 
    "key": "wvskx5emjft6we3lm07f9uqya4f05s5v"
}
```

### Delete Server

```javascript
// Request - will delete a server
GET https://youramoninstance/api/v1/servers/delete/[server_id]/?api_key=apikey

// Response
{
    "status": 200, 
}
```

## Alerts

### List Alerts

```javascript// Request - will list all alerts
GET https://youramoninstance/api/v1/alerts/list/?api_key=apikey

// Response
{
    "status": 200, 
    "alerts": [
        {
            "metric": "Disk above 5% for 30 seconds", 
            "type": "global", 
            "id": "54ddb8f91d41c8fd7e20264e", 
            "mute": false
        }, 
        {
            "metric": "Loadavg above 2 for 300 seconds", 
            "type": "system", 
            "id": "54f88b6f1d41c8d5b48e5e9f", 
            "mute": false
        }, 
    ]
}
```

### Mute Alert

```javascript
// Request - will mute and alert
GET https://youramoninstance/api/v1/alerts/mute/[alert_id]/?api_key=apikey

// Response
{
    "status": 200, 
    "muted": true
}
```

### Mute All Alerts

```javascript
// Request - will delete a server
GET https://youramoninstance/api/v1/alerts/mute/all/?api_key=apikey
// Response
{
    "status": 200, 
}
```
### Unmute All
```javascript
// Request - will delete a server
GET https://youramoninstance/api/v1/alerts/unmute/all/?api_key=apikey
// Response
{
    "status": 200, 
}
```

## Cloud Servers

### List

```javascript
// Request - will sync your cloud servers
GET https://youramoninstance/api/v1/cloudservers/sync/(amazon|digitalocean|rackspace|linode)/?api_key=apikey

// Response
{
    "status": 200, 
    "message": "Amazon servers synced"
}
```


##  Health Checks

### List Checks
```javascript
// Request
GET https://youramoninstance/api/v1/healthchecks/list/?api_key=apikey

// Response
{
    "status": 200, 
    "checks": [
        {
            "last_executed": 1447575035,
            "execute_every": 180,
            "filename": "check-ports.py",
            "paused": false,
            "params": "-p 80,20,443,25",
            "result": [
                {
                    "status": "critical",
                    "message": "Can't connect to ports (80, 25, 443, 20)",
                    "check": "CRITICAL",
                    "server": {
                        "name": "ubuntu14",
                        "id": "559a3c4b1d41c87694dba3ca"
                    }
                }
            ],
            "id": "5643c4db1d41c86307d5fc80"
        },
    ]

}
```

### Delete Check
```javascript
// Request - will delete a health check
GET https://youramoninstance/api/v1/healthchecks/delete/[check_id]/?api_key=apikey
// Response
{
    "status": 200, 
}
```

### Pause Check
```javascript
// Request - will pause a health check
GET https://youramoninstance/api/v1/healthchecks/pause/[check_id]/?api_key=apikey
// Response
{
    "status": 200, 
}
```


### Resume Check
```javascript
// Request - will resume a health check
GET https://youramoninstance/api/v1/healthchecks/resume/[check_id]/?api_key=apikey
// Response
{
    "status": 200, 
}
```

### Pause All
```javascript
// Request - will pause all health checks
GET https://youramoninstance/api/v1/healthchecks/pause/all/?api_key=apikey
// Response
{
    "status": 200, 
}
```

### Resume All
```javascript
// Request - will resume all health checks
GET https://youramoninstance/api/v1/healthchecks/resume/all/?api_key=apikey
// Response
{
    "status": 200, 
}
```