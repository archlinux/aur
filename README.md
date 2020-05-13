# aur-sync_gateway-bin

An AUR package for Couchbase [Sync Gateway](https://github.com/couchbase/sync_gateway) Open Source Edition (OSE) compiled from source.

## Getting Started

This package adheres to the Filesystem Hierarchy Standard, instead of the typical Couchbase Sync Gateway installation directories, so some things to note:

### Binary Location

The binary can be run standalone, and is at `/usr/bin/sync_gateway`.

### Systemd Service

Start/Enable the systemd service:

```
# systemctl start sync_gateway
# systemctl enable sync_gateway
```

### Config File

The configuration file is at `/etc/sync_gateway.json`.

You must restart Sync Gateway for any configuration changes to take effect.

### Log Files

Log files are written to `/var/log/sync_gateway`, in addition to journalctl.
