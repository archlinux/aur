# hermes-agent-hardening

Systemd hardening, AppArmor profiles, and instance management for Hermes Agent.

## What it does

- Creates per-instance systemd services (`hermes-gateway@.service`,
  `hermes-dashboard@.service`) with filesystem, network, and capability
  restrictions
- Generates per-instance AppArmor profiles in complain or enforce mode
- Applies memory, CPU, and task limits
- Blocks LAN access except addresses you explicitly allow
- Makes the Hermes managed venv read-only inside services
- Prevents the agent from modifying its own systemd configuration
- Provides a restricted log helper (`hermes-logs`)

## Quick start

```sh
# Install
paru -S hermes-agent-hardening

# Create the default instance
sudo hermes-instance enable --now hermes

# Configure a model provider
sudo -u hermes $EDITOR /var/lib/hermes/.hermes/config.yaml

# Start using it
systemctl status hermes-gateway@hermes.service
```

## Multiple instances

```sh
sudo hermes-instance enable --now hermes-work
```

Each instance runs as its own system user with its own home, config, and
hardening profile. Instances are isolated from each other by Unix
permissions and AppArmor.

## Dashboard

The dashboard is optional and requires lingering (the instance user's
session manager runs at boot):

```sh
sudo hermes-instance enable --now --dashboard hermes
```

## Configuration

Global defaults live in `/etc/hermes-agent-hardening/default.conf`.
Per-instance overrides live in
`/etc/hermes-agent-hardening/instances/NAME.conf`.

After editing, regenerate:

```sh
sudo hermes-instance regenerate --all
```

### AppArmor

Only the gateway is AppArmor-confined. systemd does not support
`AppArmorProfile=` for user services, so the dashboard runs unconfined
by AppArmor (systemd hardening still applies).

Profiles start in complain mode. Review the logs:

```sh
journalctl -k | grep apparmor
```

Then switch to enforce by setting `Mode=enforce` in the config and
regenerating:

```sh
sudo hermes-instance regenerate hermes
```


### Network

By default, each instance can reach the internet and loopback but no LAN
addresses. Add allowed addresses in the config:

```ini
[Network]
Allow=192.168.1.26
Allow=192.168.1.27
```

### Limits

```ini
[Limits]
MemoryHigh=3G
MemoryMax=4G
CPUWeight=50
TasksMax=1024
```

### Slice limits (dashboard/webui user services)

The user slice has separate defaults:

```ini
[Limits]
SliceMemoryHigh=6G
SliceMemoryMax=7G
```

Override per instance if needed. The gateway's `MemoryHigh`/`MemoryMax` apply only to the gateway service itself.

### Migrating an existing instance

If you already run Hermes with a custom unit:

```bash
systemctl stop hermes-gateway.service
systemctl disable hermes-gateway.service
sudo hermes-instance enable --adopt --now hermes
```

If your existing slice has LAN allow entries (check `/etc/systemd/system/user-<uid>.slice.d/60-network.conf`), copy them to `/etc/hermes-agent-hardening/default.conf` under `[Network]` before regenerating.


## Removing an instance

Run this **before** uninstalling the package:

```sh
sudo hermes-instance remove hermes-work
```

If the package is already removed, generated files are cleaned up by the
post-remove hook, but the user and home remain. Remove them manually:

```sh
userdel -r hermes-work
```

## How it works

The package ships template systemd units using `%i` for the instance
name. `hermes-instance enable NAME` creates the user, calls the
generator (`hermes-hardening-config`) to produce per-instance drop-ins
and AppArmor profiles, then enables the service.

A pacman hook regenerates all instance hardening after each
`hermes-agent` update, so the read-only venv path and other versioned
references stay current.

### Environment changes

If Hermes rebuilds its managed environment at runtime (e.g. after
`hermes pm repair`), the read-only venv path may change. Run:

```sh
sudo hermes-instance regenerate --all
```

to update the read-only drop-ins. The pacman hook handles this
automatically after `hermes-agent` package updates, but not after
Hermes' own environment changes.
