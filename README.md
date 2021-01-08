# auto-xrandr

auto-xrandr is a small tool that assists in creating xrandr configurations.

Its intended use it to be run automatically when a display is connected or disconnected, via its included udev rule.
It can also be run manually at the command line.

When run with no arguments, auto-xrandr will execute `$XDG_CONFIG_HOME/auto-xrandr/configure-outputs`, passing in some information about connected displays over stdin.
The `configure-outputs` script is run as the user who owns it, in a new login shell, inheriting the `DISPLAY` environment variable from auto-xrandr.
Its input consists of lines in the format `<xrandr_name> <product_id> <serial_no>`.
For example:

```
eDP-1 1234 0
DP-4 56789 7654321
DP-3-2 56789 8765432
```

It is intended that the `configure-outputs` script will use the product ID and serial number to identify the display independent of how it is connected, and then configure it using xrandr.
An example `configure-outputs` script:

```bash
#!/bin/sh
while read -r output product serial; do
    case "$product:$serial" in
    56789:8765432)
        xrandr --output "$output" --scale 1.5x1.5 --pos 0x0       --primary
        ;;
    56789:7654321)
        xrandr --output "$output" --scale 1.5x1.5 --pos 5760x0
        ;;
    1234:0)
        xrandr --output "$output" --scale 2x2     --pos 3840x3240
        ;;
    esac
done
```

When auto-xrandr is run with the `--list` flag, it will write the display information to stdout instead of calling `configure-outputs`.

## Limitations

auto-xrandr assumes that only one user has an active Xorg session.
If more than one user is running X, it will arbitrarily pick one of their `configure-outputs` scripts to execute.

When invoked via udev, auto-xrandr assumes `DISPLAY=:0`.
When invoked manually, it correctly inherits the `DISPLAY` variable.

## Requirements

auto-xrandr has no dependencies other than xrandr and a POSIX compliant runtime.

Udev is required for automatic detection of changes to connected displays.