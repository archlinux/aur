# clashup

An updator for clash on Archlinux

## Install 
`$ git clone https://github.com/felinae98/clashup.git && cd clashup && makepkg -si`

or use aur

`yay -Sy clashup`

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
    "is_subscribe_banned": false, 
    "custom_rules": [],
    "mmdb_file_url": "http://www.ideame.top/mmdb/Country.mmdb",
    "mmdb_version_url": "http://www.ideame.top/mmdb/version"
}
```
* Set `is_subscribe_banned` true if your subscribe address was banned.
* `http_port` is required if `is_subscribe_banned` is true
* If you both set `mmdb_file_url` and `mmdb_version_url` it will update `Country.mmdb` file every start up time.
## How it works
It just simply download the subscribe config file and override `http-port`, `socks-port`, `redir-port`, `allow-lan`, `external-controller` in the config file, and append `custom_rules` to `Rules`.

If your can access your subscribe url directly, it just download and update config file before clash start.

Otherwise your subscribe url is banned, it download and update the config file after clash start and then restart clash.

## FAQ

* How to see log
  
    `journalctl --user -u clash -e`

* How to add custom rules

    edit `~/.config/clash/clashup.json` and `systemctl --user restart clash`
