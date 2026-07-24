# pipewire-bluez5-lhdc-git

Builds the official PipeWire master branch's bluez5 SPA plugin with upstream
LHDC v5 codec support. The package includes the complete BlueZ codec plugin set
from the same build so that all plugins use a compatible ABI.

It installs the plugin set into `/usr/lib/spa-0.2-lhdc` and expects
`wireplumber-lhdc-config` to prepend that directory to `SPA_PLUGIN_DIR`.

Dependencies:

- `pipewire-audio`
- `liblhdcv5`
- `wireplumber-lhdc-config`
