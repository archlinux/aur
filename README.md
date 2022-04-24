# nordquery

usage: nordquery [-h] [-u] [-c country] [-f features] [-p protocols] [--list-protocols] [--server-url] [-v]

A tool for choosing NordVPN servers, Version 1.1

## Options:
  
  `-h, --help` - Show help message and exit  
  `-u, --update` - Update the server database  
  `-c COUNTRY, --country COUNTRY` - Filter by country.  
  `-f FEATURES, --number FEATURES` - Filter by server features, see list below  
  `-p PROTOCOLS, --protocols PROTOCOLS` - Filter by server protocols, see list below  
  `-e EXCLUDE, --exclude EXCLUDE` - Exclude these servers from the list
  `--list-protocols` - List the protocol options available  
  `--server-url` - Override the default server database url (https://nordvpn.com/api/server)
  `--no-ping` - Don't ping the server to check connectivity    
  `-v, --verbose` - Be verbose  
  
## Countries:  
Countries can be selected using their english name or ISO3166 code, some abbreviations will work but cannot be guaranteed.  
Use `any` to explicitly match any country, overrides the default in configuration file.
  
## Features:
The following selections can be made using the -f argument:  
  
- `any` : Don't filter based on features, overrides the config file default  
- `sta` : Standard VPN servers  
- `ded` : Dedicated IP address servers  
- `doub` : Double VPN servers  
- `obf` : Obfuscated servers  
- `p2p` : Servers optimised for P2P usage  
- `tor` : Onion over VPN servers  
  
For details of these servers and their intended usage check the NordVPN documentation.  

## Protocols:

The following protocols can be selected with the -p argument:  
  
- `ikev2`  
- `openvpn_udp`  
- `openvpn_tcp`  
- `socks`  
- `proxy`  
- `pptp`  
- `l2tp`  
- `openvpn_xor_udp`  
- `openvpn_xor_tcp`  
- `proxy_cybersec`  
- `proxy_ssl`  
- `proxy_ssl_cybersec`  
- `ikev2_v6`  
- `open_udp_v6`  
- `open_tcp_v6`  
- `wireguard_udp`  
- `openvpn_udp_tls_crypt`  
- `openvpn_tcp_tls_crypt `  
- `openvpn_dedicated_udp`  
- `openvpn_dedicated_tcp`  
- `skylark`  
- `mesh_relay `
  
`--list-protcols` will list these options.  
For details of these protocols and their usage consult the NordVPN documentation.  

## Exlude

Servers can be manually exluded using the `-e` or `--exlude` option, enter the server with the short code e.g. `-e us1234`    
  
## Configuration file:

A user configuration file can be used in this location: /home/[USER]/.config/nordquery/nordquery.conf  
  
The structure is:  
  
`[defaults]`  
`always_update = yes/no` - forces an update of the server database with every query  
`country = xx` or `any` - an ISO3166 code for the default country  
`features = xxx xxx` or `any`  - a list of the default features to use, e.g. `sta p2p`  
`db_path = /xxx/yyy` - path to store the server database file, overrides the default (`/home/[USER]/.cache/nordquery`)  
`db_filename = xxx` - name for server database file, overrides the default (`server.db`)  
`blacklist = xx1234 yy5678` - Never match these servers  
  
These settings will be overriden by command line arguments.
  

Simon Williams 14/04/22  
simon@clockcycles.net
