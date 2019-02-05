Fix Bluetooth Audio A2DP Sinks
===

Fix Bluetooth A2DP using systemd and udev rule

> a rewrite from https://gist.github.com/EHfive/c4f1218a75f95b076f0387403246de78, avoid blocking other BT dev connecting

## Usage

install this AUR first:

```
yay -S fix-bt-a2dp
```

run this command with root to set GUI session owner:

```
/usr/bin/fix-bt-a2dp set-user [user]
```
