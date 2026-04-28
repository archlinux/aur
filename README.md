# comfyui (AUR)

Arch Linux package for [ComfyUI](https://github.com/Comfy-Org/ComfyUI), a powerful and modular diffusion model GUI with a graph/nodes interface.

## Installation

```bash
sudo pacman -S comfyui
```

The install script automatically detects your GPU via `lspci` and installs the appropriate PyTorch variant:

| GPU          | PyTorch variant |
|--------------|-----------------|
| AMD (Radeon) | ROCm 7.2        |
| NVIDIA       | CUDA 13.0       |
| Other / None | CPU-only        |

### Overriding GPU detection

To force a specific GPU backend, set `COMFYUI_GPU` before installing:

```bash
sudo COMFYUI_GPU=cuda pacman -S comfyui
```

Valid values: `rocm`, `cuda`, `cpu`.

## Usage

Run directly:

```bash
comfyui
```

Or enable the systemd service:

```bash
systemctl enable --now comfyui
```

The web UI is available at `http://localhost:8188`.

## Configuration

### Model paths

Edit `/etc/comfyui/extra_model_paths.yaml` to configure model directories. This file is protected by pacman (`backup=()`), so your changes are preserved on upgrade.

Example:

```yaml
comfyui:
    base_path: /var/lib/comfyui/models
    diffusion_models: diffusion_models/
    loras: loras/
    text_encoders: text_encoders/
    vae: vae/
    is_default: true
```

**Note:** You must list each subdirectory explicitly — `base_path` alone is not sufficient.

### Installation prefix

The default installation directory is `/opt/comfyui`. To install elsewhere (e.g., a larger drive), edit `_prefix` in the `PKGBUILD` before building:

```bash
_prefix="/var/remise/comfyui"
```

## Uninstall

The Python venv and user data are preserved on removal to avoid re-downloading ~6 GB of PyTorch. To clean up manually:

```bash
sudo rm -rf /opt/comfyui        # or your custom _prefix
sudo rm -rf /var/lib/comfyui
```
