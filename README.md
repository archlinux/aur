# wireplumber-lhdc-config

Arch package that enables the out-of-tree LHDC v5 PipeWire bluez5 plugin for
WirePlumber.

It installs:

- `/usr/share/wireplumber/wireplumber.conf.d/51-bluez-lhdc.conf`
- `/usr/lib/systemd/user/wireplumber.service.d/50-lhdc.conf`

The systemd drop-in prepends `/usr/lib/spa-0.2-lhdc` to `SPA_PLUGIN_DIR` and
disables `MemoryDenyWriteExecute` for WirePlumber because the LHDC helper uses
QEMU TCG.

After installing:

```sh
systemctl --user daemon-reload
systemctl --user restart wireplumber
```
