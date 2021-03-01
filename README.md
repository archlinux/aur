# Updating this package
`yay -Y --gendb; yay -Syu --devel`

# Known issue
For whatever reason, the software does not build if the port used by `bitcoind` 8332 is already in use. Make sure that the port is unused. This might not always be the cause for the error. In those circumstances, a reboot helps. I have found no solution yet. I assume it is the software's fault.

# Installation
## Necessary configuration
### bitcoind
1. `nano /etc/bitcoin/bitcoin.conf` Uncomment "prune=550". Set "rpcuser=" and "rpcpassword=" how you like. You will need those values later.

### nbxplorer
1. `nano ~/.nbxplorer/Main/settings.config` Set "btc.rpc.auth=" according to the prior set values in the bitcoind configuration file.

### btcpayserver
1. `nano ~/.btcpayserver/Main/settings.config` Uncomment the SQLite database line. Alternatively, a different can be used instead.

### nginx
1. `sudo nano /etc/nginx/nginx.conf`

## Required services
1. `sudo systemctl start bitcoind.service`
2. `sudo systemctl enable bitcoind.service`


## Usage
* Start: `btcpayserver-start`
* Stop: `btcpayserver-stop`
