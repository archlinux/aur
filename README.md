# samsung-galaxybook-audio

Arch package for initializing the internal speaker amplifier on Samsung Galaxy Book laptops with the Realtek ALC298 codec.

The package installs:

- `/usr/bin/samsung-galaxybook-audio-init`
- `samsung-galaxybook-audio.service` for boot-time initialization
- a `system-sleep` hook for suspend/resume
- a WirePlumber rule that disables ALSA output suspend

## Install locally

```sh
makepkg -si
sudo systemctl enable --now samsung-galaxybook-audio.service
systemctl --user restart wireplumber
```

## Test

```sh
sudo samsung-galaxybook-audio-init
systemctl status samsung-galaxybook-audio.service
```
