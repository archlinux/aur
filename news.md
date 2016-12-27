OpenVPN 2.4.0 update requires administrative interaction
========================================================

The upgrade to openvpn 2.4.0 makes changes that are incompatible with
previous configurations. Take **special care** if you depend on VPN
connectivity for **remote access**! Administrative interaction is required:

* Configuration is expected in sub directories now. Move your files
  from `/etc/openvpn/` to `/etc/openvpn/server/` or `/etc/openvpn/client/`.
* The plugin lookup path changed, remove extra `plugins/` from relative
  paths.
* The systemd unit `openvpn@.service` was replaced with
  `openvpn-client@.service` and `openvpn-server@.service`. Restart and
  reenable accordingly.

This does not affect the functionality of `networkmanager`, `connman`
or `qopenvpn`.
