# Installation
## Necessary configuration
### bitcoind
1. `sudo nano /etc/bitcoin/bitcoin.conf` and set "rpcuser=" and "rpcpassword=" how you like. You will need those values later. Optionally, uncomment "prune=550".

### NBXplorer
1. `nano ~/.nbxplorer/Main/settings.config` and set "btc.rpc.auth=" according to the priorly set values in the bitcoin configuration file.

### BTCPayServer
1. `nano ~/.btcpayserver/Main/settings.config` and configure your database.

### Nginx
1. You can use any HTTP server which supports reverse proxying. Instructions are given for Nginx.
2. `sudo nano /etc/nginx/nginx.conf` and configure your Nginx server as a reverse HTTP proxy to the BTCPayServer HTTP server. Additional headers are needed as otherwise the website will show an error that HTTPS is not used. You also need to create SSL keys.
```
http
{
    # Variables
    map $scheme $proxy_x_forwarded_ssl
    {
        default off;
        https   on;
    }

    map $http_upgrade $proxy_connection
    {
        default upgrade;
        ""      close;
    }

    # Directives
    ## SSL certificate
    ssl_certificate_key /etc/letsencrypt/live/subdomain.example.com/privkey.pem;
    ssl_certificate     /etc/letsencrypt/live/subdomain.example.com/fullchain.pem;

    server
    {
        listen      443 ssl;
        listen      [::]:443 ssl;
        server_name subdomain.example.com;

        location /
        {
            # Proxy
            proxy_pass          http://localhost:5285;
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

## Optional configuration
Information on the lightning connection string can be found [here](https://github.com/btcpayserver/BTCPayServer.Lightning). Decide for one lightning implementation.

### c-lightning
1. `nano ~/.btcpayserver/Main/settings.config` and add the setting "BTC.lightning=type=clightning;server=unix://home/USERNAME/.lightning/lightning-rpc".

### LND
1. `lnd` as a private key needs to be generated.
2. `lncli create` and create your necessary wallet or restore an existing one.
3. `sudo nano /etc/bitcoin/bitcoin.conf` and add the following parameters so that they are used and not applied to a mode which is not running.
```
zmqpubrawblock=tcp://127.0.0.1:28332
zmqpubrawtx=tcp://127.0.0.1:28333
```
4. `nano ~/.btcpayserver/Main/settings.config` and append the output of `openssl x509 -noout -fingerprint -sha256 -in ~/.lnd/tls.cert | sed -e "s/.*=//;s/://g"` to the file line "BTC.lightning=type=lnd-rest;server=https://127.0.0.1:8080/;macaroonfilepath=/home/USERNAME/.lnd/data/chain/bitcoin/mainnet/admin.macaroon;certthumbprint=".

## Required services
1. bitcoind.service

# Usage
* Finally, all software needs to be run. The following shows how to run the software and its dependencies with `tmux`.
* Start:
```
tmux new-session -s c-lightning -d "lightningd --network=bitcoin --bitcoin-rpcuser=USERNAME --bitcoin-rpcpassword=PASSWORD --log-level=info --rpc-file=/home/USERNAME/.lightning/lightning-rpc;bash -i"
```
or
```
tmux new-session -s lnd -d "lnd --bitcoin.active --bitcoin.mainnet --bitcoin.node=bitcoind --bitcoind.rpcuser=USERNAME --bitcoind.rpcpass=PASSWORD --bitcoind.zmqpubrawblock=tcp://127.0.0.1:28332 --bitcoind.zmqpubrawtx=tcp://127.0.0.1:28333 --externalip=localhost;bash -i"
lncli unlock
```

```
tmux new-session -s nbxplorer -d "nbxplorer;bash -i"
tmux new-session -s btcpayserver -d "btcpayserver;bash -i"
```
* Stop:
```
tmux kill-session -t c-lightning
```
or
```
tmux kill-session -t lnd
```

```
tmux kill-session -t nbxplorer
tmux kill-session -t btcpayserver
```
