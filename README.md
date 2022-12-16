# clashup

An updator for clash on Archlinux with yacd

## Install 
`$ git clone https://github.com/chiro2001/clashup-yacd.git && cd clashup && makepkg -si`

or use aur

`yay -Sy clashup-yacd`

and just

`$ systemctl --user start clash`

## Config
The config file is `~/.config/clash/clashup.json`
```json
{
    "http_port": 7890,
    "socks5_port": 7891,
    "redir_port": 7892, 
    "allow_lan": true,
    "external_controller": "127.0.0.1:9090",
    "external_ui": "/usr/share/yacd",
    "subscribe_url": "",
    "custom_rules": [],
    "custom_proxies": [],
    "custom_groups": [],
    "is_subscribe_banned": false, 
    "mmdb_file_url": "http://www.ideame.top/mmdb/Country.mmdb",
    "mmdb_version_url": "http://www.ideame.top/mmdb/version"
}
```
* Set `is_subscribe_banned` true if your subscribe address was banned.
* `http_port` is required if `is_subscribe_banned` is true
* If you both set `mmdb_file_url` and `mmdb_version_url` it will update `Country.mmdb` file every start up time.

You can also set `custom_*` to add more proxies and groups manually in your clashup.json:

```json
{
    "custom_rules": [
        "DOMAIN-SUFFIX,myschool.edu.cn,EasyConnect",
        "IP-CIDR,10.0.0.0/8,EasyConnect"
    ],
    "custom_proxies": [
        {"name": "easyconn_local", "type": "socks5", "server": "127.0.0.1", "port": 1080},
        {"name": "easyconn_http_local", "type": "http", "server": "127.0.0.1", "port": 8888},
        {"name": "easyconn", "type": "socks5", "server": "myschool.proxy.com", "port": 1080},
        {"name": "easyconn_http", "type": "http", "server": "myschool.proxy.com", "port": 8888}
    ],
    "custom_groups": [
        {"name": "EasyConnect", "type": "select", "proxies": ["easyconn", "easyconn_http", "easyconn_local", "easyconn_http_local"]}
    ]
}
```

## How it works
It just simply download the subscribe config file and override `http-port`, `socks-port`, `redir-port`, `allow-lan`, `external-controller` in the config file, and append `custom_*` to `Rules`.

If your can access your subscribe url directly, it just download and update config file before clash start.

Otherwise your subscribe url is banned, it download and update the config file after clash start and then restart clash.

## FAQ

* How to see log
  
    `journalctl --user -u clash -e`

* How to add custom rules

    edit `~/.config/clash/clashup.json` and `systemctl --user restart clash`
