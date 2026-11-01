# cordiale-bin

Community-maintained AUR packaging of the official
[Cordiale releases](https://github.com/Sythos/Cordiale/releases) for Arch Linux
x86_64. Cordiale is a native desktop client for Grappa chat, written in Rust
with Slint. It uses Grappa's REST and Phoenix Channels APIs and includes
channels, direct messages, user settings and server administration features.

## Installation

```sh
yay -S cordiale-bin
```

Alternatively, clone the AUR repository, review `PKGBUILD`, and run `makepkg -si`.
The package installs the `cordiale` command, an application-menu entry and an
icon. Rust and Cargo are not required to install this binary package.

Launch **Cordiale** from your desktop's application menu or run:

```sh
cordiale
```

Enter the URL of your Grappa instance and sign in through the application.
A local Grappa server is optional. Cordiale connects to Grappa; it is not a
standalone client for arbitrary IRC servers.

## Desktop integration

X11 and Wayland runtime libraries are included in the package dependencies.
Use a working OpenGL driver appropriate for your hardware.

Optional integrations:

- A Secret Service provider, such as GNOME Keyring or KWallet, for credentials.
- `xdg-desktop-portal` and a backend for your desktop, for native file dialogs.
- `xdg-utils`, to open links in your default browser.
- `grappa-bin`, if you want to host a Grappa server on this machine.

Settings are stored under `~/.config/cordiale`, application data under
`~/.local/share/cordiale`, and logs under `~/.local/state/cordiale`, following
the corresponding XDG variables when set. Package removal preserves your data.
See the [upstream installation guide](https://github.com/Sythos/Cordiale/blob/main/docs/installation.md)
for supported authentication flows and platform limitations.

## Versions and maintenance

The upstream binary version includes its GitHub Actions run ID: release
`v1.0.4`, for example, ships package version `1.0.4.41204204168`. This AUR
package preserves that version and provides/conflicts with `cordiale`.

Downloads use a specific release tag and SHA-256 checksums. The MIT license
is retrieved from the same tag and installed alongside the binary. Upstream
package metadata is replaced with Arch packaging metadata maintained here.

A maintainer-side timer checks stable GitHub releases every six hours when
available. Automatic updates require checksum verification, metadata and
desktop-entry review checks, a successful `makepkg` build and no `namcap`
errors. Changes to dependencies, licensing or the expected payload layout
require manual review. Package availability does not automatically install
updates on users' machines; use your AUR helper as usual.

Report packaging problems on the AUR page. Report application bugs to
[Sythos/Cordiale](https://github.com/Sythos/Cordiale/issues).
