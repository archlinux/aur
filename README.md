Simulate `tlp-rdw` of [TLP](https://github.com/linrunner/TLP)'s behaviour on `systemd-networkd` systems without `NetworkManager`.

# Installation

Install the AUR package ([`tlp-rdw-systemd`](https://aur.archlinux.org/packages/tlp-rdw-systemd)) on Arch (or place files equivalently on other distros) and then:
```
#systemctl enable --now tlp-rdw.path
```

# Configuration

The standard [upstream `tlp-rdw` conf](https://github.com/linrunner/TLP/blob/d253338a556d72815d25eb9ca6ae747632490c13/tlp.conf.in#L605-L623) is read for devices to enable/disable on link dis/connect, e.g. `DEVICES_TO_ENABLE_ON_WWAN_DISCONNECT`.

Dock triggers are not presently implemented.

## Enable/disable radios on link state change

The link type name needs a corresponding `iproute2` [link group](https://man.archlinux.org/man/ip-link.8#%3Ci%3EGROUP%3C/i%3E) in order to take effect, e.g.:
```
# /etc/iproute2/group
123 lan
456 wifi
789 wwan
```

Which should then be specified numerically (`systemd` [does not currently](https://github.com/systemd/systemd/issues/40293) support named values) in the interface's `.network` unit:
```
# /etc/systemd/network/10-example.network
[Match]
Type=ether

[Link]
Group=123
```
after which you'll need to reload `systemd-networkd`:
```
#systemctl reload systemd-networkd
```

If you choose to use `ethernet` or `wlan` as names, they'll act as aliases for `lan` and `wifi` respectively for `tlp.conf` lookup purposes, since that's what upstream documents. This is just for convenience; you can use any names you wish including being more granular, just as long as it matches the parameter name. i.e.:
```
# /etc/iproute2/group
1 wireless1
2 wireless2
```
```
# /etc/tlp.conf
DEVICES_TO_DISABLE_ON_WIRELESS1_CONNECT="gps bluetooth"
DEVICES_TO_ENABLE_ON_WIRELESS2_DISCONNECT="wimax fm"
```

The values of the parameters must match [`rfkill` device type names](https://man.archlinux.org/man/rfkill.8#COMMANDS).
