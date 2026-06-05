# alc298-hda-init

Initialize the Realtek ALC298 codec using `hda-verb`.

Originally made for the Razer Blade 16 - RZ09-0510 (2024), but should work on other Razer Blade models using the ALC298 codec.

## Install

### Arch Linux (AUR) — recommended

Dependencies are handled automatically.

```bash
yay -S alc298-hda-init
systemctl --user enable --now alc298-hda-init.service
```
Updates automatically with `yay -Syu`.

### Manual

**1. Install dependencies**

```bash
sudo pacman -S alsa-utils
```

**2. Clone and install**

```bash
git clone https://github.com/yorukai/alc298-hda-init.git
cd alc298-hda-init
makepkg -si
systemctl --user enable --now alc298-hda-init.service
```

## Notes

The script automatically detects the correct ALSA hardware device, e.g.:

```text
/dev/snd/hwC1D0
```

and applies the configured `hda-verb` commands.
