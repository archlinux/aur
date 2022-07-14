# i3 Workspace Names Daemon

## AUR Package

**For Usage and configuration, everything is explained the main project readme**

### installation

Please refer to [The Arch Wiki](https://wiki.archlinux.org/title/Arch_User_Repository#Installing_and_upgrading_packages)

Or choose [an helper](https://wiki.archlinux.org/title/AUR_helpers)

### usage

Instead of `exec_always --no-startup-id exec i3-workspace-names-daemon`

You should place `exec_always --no-startup-id exec python -m i3-workspace-names-daemon`

In you i3 configuration file

(Plase notice the `python -m` addition)
