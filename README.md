# WhatsApp desktop editions

WhatsApp Web as a Linux desktop app with a tray icon, close-to-tray behavior, a menu bar, spell checking, and save-as downloads. The standard package is just the desktop app. The remote-control edition adds authenticated local CLI/MCP access to list conversation summaries and send individually approved messages from the same logged-in window.

## Packages

- `whatsapp-nativefier`: desktop integration only, with no automation service or WA-JS.
- `whatsapp-nativefier-with-remote-control`: desktop app plus authenticated local CLI/MCP controls.

Both are built by this PKGBUILD. They conflict deliberately and retain the same application name, install path and profile. Choose one; do not run clients sharing the same linked-device identity concurrently.

Nativefier upstream is archived. This package pins Electron 44.4.1 and patches the legacy runtime for sandboxing, context isolation and restricted permissions. This is local maintenance, not a guarantee of future WhatsApp compatibility.

## Build

Run `makepkg` to build both editions, then install the chosen package with `pacman -U`. Build requirements include Nativefier 52.0.0, ImageMagick, unzip and Node >=22; the legacy packager uses Node 22 through nvm when available.

This AUR repository contains flat, readable build inputs. `prepare()` reconstructs the module directory and `build()` creates the two runtime variants. No generated control-source archive is committed.

## Local controls

Launch `whatsapp-nativefier-with-remote-control`, then use `whatsapp-controls version` to read the current public website build. Close the app and relaunch with `WHATSAPP_CONTROLS_WEB_VERSION` set to that verified build. Version discovery works without a pin; listing and sending do not.

Use `whatsapp-controls --help` for commands. The private Unix socket requires authentication. Sending requires an exact recipient/content approval on the terminal. Unknown submissions are never automatically retried. No incoming-message stream or unattended chatbot policy is provided.

## Source and verification

Full source, development tests, verified live behavior and security limitations are documented at [the GitLab source mirror](https://gitlab.com/nowaker/aur-whatsapp-nativefier). The development `npm` commands apply to that full checkout, not this AUR-only build-input repository.
