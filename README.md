k810-conf
==========

**Homepage**: http://www.trial-n-error.de/posts/2012/12/31/logitech-k810-keyboard-configurator/

## USAGE

**Manually**

```
# k810-conf -d /dev/hidraw<n> $DEVNAME -f on    # n is 1,2,3,4
```

**Use udev rules**

```
# edit /etc/udev/rules.d/10-k810-conf.rules

    ATTRS{address}=="FIXME"    # you can get address by `hcitool dev`
```
