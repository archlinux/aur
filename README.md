# CaptureAge for Arch Linux

Unofficial AUR packaging of CaptureAge:DE 1.26.0.
Spectate Age of Empires II: Definitive Edition through Steam Proton.

[![Automation health](https://github.com/Firstp1ck/captureage-bin/actions/workflows/health.yml/badge.svg)](https://github.com/Firstp1ck/captureage-bin/blob/automation-health/health.json)

Linux compatibility depends on your Proton version. Startup has been verified;
replay playback has not been tested in a live game session.

## Install

Requires x86-64 Arch Linux, native Steam and Protontricks, and ownership of
AoE II: DE. Flatpak Steam needs additional setup and is not covered here.
CaptureAge is proprietary: read the [terms](https://captureage.com/terms).
Core features are free; some require a subscription.

Install **captureage-bin** from the [AUR](https://aur.archlinux.org/packages/captureage-bin)
with an AUR helper such as `yay`:

```sh
yay -S captureage-bin
```

## First launch

1. Install AoE II: DE in Steam, select a recent Proton version in the game's
   Compatibility settings, and launch the game once.
2. Keep Steam open and start the game, then open **CaptureAge** from the
   application menu or run `captureage`.

The launcher fixes missing or invalid game-path settings and backs up existing
settings before changing them.

To enable **Spectate with CA** in the game, close the game and run
`captureage --register`. This optional step changes your game's settings.

Update CaptureAge through your AUR helper; the built-in Windows updater cannot
update this installation.

## More information

- [Advanced setup and troubleshooting](https://github.com/Firstp1ck/captureage-bin/blob/main/TECHNICAL.md)
- [Maintenance and automation](https://github.com/Firstp1ck/captureage-bin/blob/main/DEVELOPMENT.md)
- [Report packaging issues](https://github.com/Firstp1ck/captureage-bin/issues)
- [CaptureAge documentation](https://captureage.com/cade/docs)
