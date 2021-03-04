# Installation
## Necessary configuration
### bitcoind
1. `nano /etc/bitcoin/bitcoin.conf` and uncomment "prune=550". Set "rpcuser=" and "rpcpassword=" how you like. You will need those values later.

### nbxplorer
1. `nano ~/.nbxplorer/Main/settings.config` and set "btc.rpc.auth=" according to the prior set values in the bitcoin configuration file.

### btcpayserver
1. `nano ~/.btcpayserver/Main/settings.config` and uncomment the SQLite database line. Alternatively, a different database can be used instead.

### nginx
1. `sudo nano /etc/nginx/nginx.conf` and configure your nginx server as a reverse HTTP proxy to the btcpayserver HTTP server.
2. Additional headers are needed as otherwise the website will show an error that HTTPS is not used.
```
http
{
    # Variables
    map $scheme $proxy_x_forwarded_ssl
    {
        default off;
        https on;
    }
    
    map $http_upgrade $proxy_connection
    {
        default upgrade;
        "" close;
    }
    
    server
    {
        listen          443 ssl;
        server_name     subdomain.domain.me;
        
        # SSL
        include /etc/letsencrypt/options-ssl-nginx.conf;
        ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;
        ssl_certificate_key /etc/letsencrypt/live/subdomain.domain.me/privkey.pem;
        ssl_certificate /etc/letsencrypt/live/subdomain.domain.me/fullchain.pem;
        
        location /
        {
            # Proxy
            proxy_pass          http://localhost:8080;
            proxy_http_version  1.1;
            proxy_set_header    Host $host;
            proxy_set_header    Upgrade $http_upgrade;
            proxy_set_header    Connection $proxy_connection;
            proxy_set_header    X-Forwarded-For $remote_addr;
            proxy_set_header    X-Forwarded-Proto $scheme;
            proxy_set_header    X-Forwarded-Ssl $proxy_x_forwarded_ssl;
            proxy_set_header    X-Forwarded-Port $server_port;
        }
    }
}
```

## Required services
1. `sudo systemctl start bitcoind.service`
2. `sudo systemctl enable bitcoind.service`


## Usage
* Start: `nbxplorer-start;btcpayserver-start`
* Stop: `nbxplorer-stop;btcpayserver-stop`
