k810-conf
==========

**Homepage**: http://www.trial-n-error.de/posts/2012/12/31/logitech-k810-keyboard-configurator/

## USAGE

**Manually**

```
$ journalctl -k | grep hidraw
> hid-generic 0005:046D:B319.0004: input,hidraw3: BLUETOOTH HID v12.02 Keyboard [Logitech K810] on 00:1a:7d:da:71:11
# k810-conf -d /dev/hidraw3 -f on    # replace hidraw3 with your own value from above

```

**Use udev rules** (Automatically set when K810 is connected)

```
# edit /etc/udev/rules.d/10-k810-conf.rules

    ..., ATTRS{address}=="00:1a:7d:da:71:11", ...    # replace 00:1a:7d:da:71:11 with your own value from above
```
