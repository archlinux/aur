Workaround fixing no A2DP when BT headphone reconnects automatically (after being paired)
===

On my ArchLinux KDE plasma setup, BT headphone will use A2DP only when connected by pairing; after disconnect and reconnect, only HSP/HFP is available

this workaround deploys a [`udev-rules`](https://wiki.archlinux.org/index.php/udev) to detect changes of BT dev and [`systemctl start fix-bt-a2dp`](https://wiki.archlinux.org/index.php/systemd) to call `fix-bt-a2dp.rb` in background with correct user

> basically a rewrite from https://gist.github.com/EHfive/c4f1218a75f95b076f0387403246de78, mainly because I want to avoid slowing down connecting of other BT devs

## Usage

install this AUR first:

```
yay -S fix-bt-a2dp
```

run this command with root to set GUI session owner:

```
/usr/bin/fix-bt-a2dp set-user [user]
```
