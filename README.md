# ComfyKick

The [Official ComfyUI Launch Process](https://github.com/Comfy-Org/ComfyUI#installing) **SUCKs**🤮, this is better.

## Why

The [ComfyUI](https://github.com/Comfy-Org/ComfyUI) is designed to be run from a `git clone` checkout. In practice this forces users to maintain a working Git tree, manually upgrade dependencies, and keep custom-node installation procedures in sync with the core requirements. ComfyKick replaces that workflow with a deterministic launcher:

- Use a single editable configuration file ([`comfykick.toml`](comfykick.toml)) to configure everything.

- Pulls ComfyUI tarball from the GitHub API (instead of Git), and caches it on disk.

- Extracts into a per-run scratch directory under a configurable `runtime_dir` (typically tmpfs).

- Drops the previous run directory on the next invocation; the on-disk ComfyUI source is never mutated by ComfyUI itself.

- The Dependency Hell of ComfyUI is gonna trigger a huge supply chain attack sooner or later.\
  ComfyKick kicks ComfyUI into [systemd sandbox](comfykick.service) instead of letting it runs on bare system. This can shrinks the attack surface, and also without hosting heavy CUDA containers.

## Install & Uninstall

### Arch based

#### Install

`yay -S comfykick`

#### Uninstall

`sudo pacman -Rsun comfykick`

### Other OS

#### Install (Manual)

- Install: `python3` `python-yaml` `uv`

- [`comfykick.py`](comfykick.py) → `~/.local/share/comfykick/comfykick.py`

- [`comfykick.service`](comfykick.service) → `~/.config/systemd/user/comfykick.service` (or `$XDG_CONFIG_HOME/systemd/user/comfykick.service`)

- [`comfykick.toml`](comfykick.toml) → `~/.config/comfykick/comfykick.toml` (or `$XDG_CONFIG_HOME/comfykick/comfykick.toml`)

#### Uninstall (Manual)

Reverse do [install](#install-manual).

## Kick

1. Edit the config file to `~/.config/comfykick/comfykick.toml` (or `$XDG_CONFIG_HOME/comfykick/comfykick.toml`)
2. `systemctl --user start comfykick.service` 🚀

## Troubleshooting

`OSError: [Errno 30] Read-only file system: '/home/you/foo/bar'`

The ComfyKick service unit sandboxes sensitive directories for safety.
So files under them are not visible / writable from inside the service.

To still use a directory under such a sensitive path, expose it to the service without disabling the sandbox.

See [`override.conf`](override.conf) for the drop-in example showing how to bind
paths explicitly.
