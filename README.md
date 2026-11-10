# colibri-git

Colibri inference engine, built from the upstream Git `main` branch for Arch Linux-compatible distributions. This package provides CPU binaries, the `coli` CLI, a local web/API server, and a templated systemd unit for running independent model instances.

For Ukrainian instructions, see [README-uk.md](README-uk.md).

## Package contents

| Path | Description |
| --- | --- |
| `/usr/bin/coli` | CLI symlink to `/usr/lib/colibri/coli` |
| `/usr/lib/colibri/` | Engines, launcher and support files |
| `/usr/lib/colibri/colibri-instance` | systemd instance launcher |
| `/usr/lib/systemd/system/colibri@.service` | systemd template unit |
| `/usr/share/colibri-git/*.conf.example` | Example instance configuration files |
| `/etc/colibri/` | Directory for administrator-managed instance configuration |
| `/usr/share/doc/colibri-git/` | Package documentation |

The actual `coli` launcher stays under `/usr/lib/colibri/` because upstream resolves paths relative to the real script location. The package does not install or update model weights.

## Configuration

The package creates `/etc/colibri/`, but does not populate it with live instance configurations. Copy an example and edit its values:

```sh
install -m 600 /usr/share/colibri-git/qwen3-coder-30b.conf.example /etc/colibri/qwen3-coder-30b.conf
install -m 600 /usr/share/colibri-git/qwen36-35b.conf.example /etc/colibri/qwen36-35b.conf
```

The example instances use these defaults:

| Instance | Model directory | Listen address | Port |
| --- | --- | --- | --- |
| `qwen3-coder-30b` | `/var/lib/llama/models/colibri/qwen3-coder-30b` | `127.0.0.1` | `8091` |
| `qwen36-35b` | `/var/lib/llama/models/colibri/qwen36-35b` | `127.0.0.1` | `8090` |

Verify that the model directory exists and review CPU affinity, OpenMP settings and memory requirements before starting a service. Instance names match `/etc/colibri/<instance>.conf`. Additional instances can be configured by creating further `.conf` files.

## systemd

To start one instance:

```sh
systemctl enable --now colibri@qwen3-coder-30b.service
systemctl status colibri@qwen3-coder-30b.service
journalctl -u colibri@qwen3-coder-30b.service -f
```

For the other example:

```sh
systemctl enable --now colibri@qwen36-35b.service
```

The package does **not** enable or start services at installation time. The template currently runs as `root` to preserve the runtime environment used by an existing root-managed Colibri installation. It does not enforce mutual exclusion between large models. Ensure enough memory is available before running multiple instances.

A manually created `/etc/systemd/system/colibri@.service` takes precedence over the packaged unit. Inspect the effective unit with `systemctl cat colibri@qwen3-coder-30b.service` and remove or migrate the local override only after reviewing it.

## API

With the example Qwen3-Coder instance running:

```sh
curl -fsS http://127.0.0.1:8091/health
curl -fsS http://127.0.0.1:8091/v1/models
```

The OpenAI-compatible endpoint is `http://127.0.0.1:8091/v1` for that example. Both example services bind to localhost by default.

## Notes

- The package uses a CPU-oriented `x86-64-v3` build; consult `PKGBUILD` for the exact build flags.
- Model files, runtime caches, and per-instance `/etc/colibri/*.conf` files are not included in the package.
- Existing manually started instances must release their listen ports before the matching systemd instance can start.
- systemd management does not change Colibri's prompt-prefill or KV-cache performance.
