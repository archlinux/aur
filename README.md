This is the vanilla Arch package with a patch that prevents the iwlwifi driver from becoming unusable due to a [beacon timeout firmware issue](https://bugzilla.kernel.org/show_bug.cgi?id=203709).

To use this, use the following kernel module parameter (e.g., in /etc/modprobe.d/wifi-fix.conf):
```
options iwlwifi beacon_timeout=256
```

The number 256 is the number of beacons that must be missed before the driver disconnects.
