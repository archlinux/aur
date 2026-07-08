# ComfyKick

The official ways to launch [ComfyUI](https://github.com/Comfy-Org/ComfyUI) **SUCKs**, this is better.

## Why

The [ComfyUI](https://github.com/Comfy-Org/ComfyUI) is designed to be run from a `git clone` checkout. In practice this forces users to maintain a working Git tree, manually upgrade dependencies, and keep custom-node installation procedures in sync with the core requirements. ComfyKick replaces that workflow with a deterministic launcher:

- Pulls ComfyUI source code tarball from the GitHub API and caches it on disk.

- Extracts into a per-run scratch directory under a configurable `runtime_dir` (typically tmpfs).

- Provisions a project-scoped venv via uv, installs `requirements.txt` (and `manager_requirements.txt` if ComfyUI-Manager is enabled), and overlays any user-supplied Python packages.

- Relinks `.venv` to a persistent `venv_cache_dir` so subsequent runs reuse the resolved environment.

- Drops the previous run directory on the next invocation; the on-disk ComfyUI source is never mutated by ComfyUI itself.

## Install & Uninstall

### Arch based

#### Install

##### AUR

`yay -S comfykick`

##### Manual

1. `git clone https://github.com/KFERMercer/ComfyKick && cd ComfyKick`

2. `makepkg -Cci`

#### Uninstall

`sudo pacman -Rsun comfykick`

### Other OS

#### Install (Manual)

- Install: `python3` `python-yaml` `uv`

- [`comfykick.py`](comfykick.py) → `~/.local/share/comfykick/comfykick.py`

- [`comfykick-user.service`](comfykick-user.service) → `~/.config/systemd/user/comfykick.service` (or `$XDG_CONFIG_HOME/systemd/user/comfykick.service`)

- [`comfykick.toml`](comfykick.toml) → `~/.config/comfykick/comfykick.toml` (or `$XDG_CONFIG_HOME/comfykick/comfykick.toml`)

#### Uninstall (Manual)

Reverse do [install](#install-manual).

## Kick

1. Edit the config file to `~/.config/comfykick/comfykick.toml` (or `$XDG_CONFIG_HOME/comfykick/comfykick.toml`)
2. `systemctl --user start comfykick.service` 🚀
