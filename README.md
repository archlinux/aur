# arch-systemd-presets

The current values of the preset included in the archlinux systemd policy don't match arch's actual policy of default service.

This package overrides the systemd defaults with presets that more closely align with how arch actually enables services on install.

By using this package, you will have more meaningful values in the "preset" field of  `systemctl status`, and are less likely to unintentially start unexpected services with
`systemctl preset-all` (including as part of `mkosi`).

However, note that if you currently rely on services that archlinux doesn't enable by default, that are listed as enabled in 90-systemd.preset, then this may break your usage of
`systemctl preset-all` until you fix your presets.
