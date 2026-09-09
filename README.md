# ComfyKick

The [Official ComfyUI Launch Process](https://github.com/Comfy-Org/ComfyUI#manual-install-windows-linux) **SUCKs**🤮, this is better.

## Why

The [ComfyUI](https://github.com/Comfy-Org/ComfyUI) is designed to be run from a `git clone` checkout: you must maintain a working Git tree, run `git pull` + `pip install -r requirements.txt` for every update, and keep custom-node installation procedures in sync with the core requirements by hand.

Comfy team obviously [know these problems too](https://github.com/Comfy-Org/Comfy-Desktop/tree/3304521ab456966c7642505a90ad3eeed26cec20#comfy-desktop). So they went on to introduce [Comfy CLI](https://github.com/Comfy-Org/comfy-cli) and [Comfy Desktop](https://github.com/Comfy-Org/Comfy-Desktop). And those are even worse. The former only completes the cloning part for you; you still have to manage the venv by hand, and run those awful commands in a specific directory. The latter, is just a damn Electron wrapper. And they still haven't solved the huge security issue caused by ComfyUI's excessive vibe coding.

In general, these messes can be resolved through proper containerized deployment. But you typically end up having to host a heavy CUDA container, and it will become the 137th copy of CUDA binfile on your disk. ComfyKick replaces all these horrors with a deterministic, sandboxed launcher:

- Use a single editable configuration file ([`comfykick.toml`](comfykick.toml)) to configure everything.

- Pulls ComfyUI tarball from the GitHub API (instead of Git), and caches it on disk.

- Extracts into a per-run scratch directory under a configurable `runtime_dir` (typically tmpfs).

- Drops the previous run directory on the next invocation; the on-disk ComfyUI source is never mutated by ComfyUI itself.

- Kicks ComfyUI into [systemd sandbox](comfykick.service) instead of letting it run on the bare system. This shrinks the attack surface without hosting heavy CUDA containers.

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

- Refresh the systemd user units:

  ```shell
  systemctl --user daemon-reload
  ```

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
