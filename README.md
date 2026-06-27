# pipewire-bluez5-lhdc-git

Arch package that builds only PipeWire's bluez5 SPA plugin and an LHDC v5 codec
plugin from `DBeidachazi/pipewire`.

It installs into `/usr/lib/spa-0.2-lhdc` and does not overwrite the system
`pipewire` package. Use `wireplumber-lhdc-config` to put this directory before
`/usr/lib/spa-0.2` in WirePlumber's `SPA_PLUGIN_DIR`.
