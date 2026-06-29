# pipewire-bluez5-lhdc-git

Builds PipeWire's bluez5 SPA plugin with LHDC v5 codec support.

It installs the plugin set into `/usr/lib/spa-0.2-lhdc` and expects
`wireplumber-lhdc-config` to prepend that directory to `SPA_PLUGIN_DIR`.

Dependencies:

- `pipewire-audio`
- `liblhdcv5`
- `wireplumber-lhdc-config`
