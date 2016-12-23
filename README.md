Fix for the 51nb X62 laptop's sound chip, which isn't recognized with default 
settings. 

Install [from AUR](https://aur.archlinux.org/packages/x62-alsa-hacks/) on Arch
and derivatives, for other systemd-enabled distributions, copy 
`snd-hda-intel-x62.conf` to `/etc/modprobe.d/` and `x62-alsa-config.service` to
`/usr/lib/systemd/system/x62-alsa-config.service`, then run `systemctl enable 
x62-alsa-config` and reboot.

Original fix by [Quintus](http://thinkpads.com/forum/viewtopic.php?p=791840#p791840), 
ported over to systemd by me.
