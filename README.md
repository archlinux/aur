# wireplumber-lhdc-config

WirePlumber configuration for the out-of-tree LHDC v5 PipeWire plugin.

It enables `lhdc_v5` in the Bluetooth codec list and prepends
`/usr/lib/spa-0.2-lhdc` to `SPA_PLUGIN_DIR`.

Restart WirePlumber after install:

```sh
systemctl --user daemon-reload
systemctl --user restart wireplumber
```
