# screenconnect-bin

Arch Linux PKGBUILD for the ConnectWise ScreenConnect remote desktop client.

## Prerequisites

You must supply `ScreenConnect.ClientSetup.sh` yourself — it is not included in this repo. Download it from your organization's ScreenConnect instance (the "Connect" or "Download" button in the web UI).

Despite the `.sh` extension, this file is a self-extracting shell script with a `tar.gz` archive embedded after a marker line. The `prepare()` function in the PKGBUILD locates that marker, extracts the archive, and installs the JARs and native libraries from it.

The installer also contains your instance-specific `ClientLaunchParameters.txt`, which is what ties the client to your ScreenConnect server.

## Usage

1. Place `ScreenConnect.ClientSetup.sh` in this directory alongside the PKGBUILD.
2. Run `makepkg -si`.

## Notes

- Requires a Java runtime (`java-runtime`) and `xdg-utils`.
- Installs a systemd service and a `.desktop` URI scheme handler so the browser "Connect" button works.
- The launcher script auto-detects Wayland/HiDPI scale via `hyprctl` if running under Hyprland.
