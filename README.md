# systemd timer and service to fetch adware and malware blocking hosts file

Fetch a hosts file from https://github.com/StevenBlack/hosts/ and overwrite `/etc/hosts` via a systemd timer and service.

Install with the `PKGBUILD` or by copying `fetch-hosts.timer` and `fetch-hosts.server` to `/etc/systemd/system`.

Enable the timer to fetch new hosts files:
```
$ systemctl enable fetch-hosts.timer
$ systemctl enable fetch-hosts.service
```
Enable only one of the following:
```
$ systemctl enable NetworkManager-wait-online.service
$ systemctl enable systemd-networkd-wait-online.service
```
