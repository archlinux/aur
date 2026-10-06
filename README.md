# Crystal Sol binary AUR package

This package installs the official Linux x86-64 launcher only. It does not build
or publish Crystal Sol source code, bypass licensing, or redistribute the game.
Frostal sign-in and a Crystal Sol license are required for the launcher to download
the game. The launcher checks authorized game downloads with SHA-256 and Minisign.

Pacman replaces bootstrap installation. No bootstrap is included. Pacman owns
`/usr/bin/crystal-sol-launcher`, the `crystal-sol` command symlink, desktop entry,
icon, and license notice. Use pacman/AUR updates for the system launcher; upstream
Setup does not manage this package. The desktop entry opens a terminal because
this official Linux launcher is a terminal application.

Official launcher releases are fetched from an immutable, versioned Frostal URL
and checked against a fixed SHA-256. Do not use mutable stable manifests as
package sources. Private game URLs, credentials, OAuth tokens, and presigned
URLs must never be added to PKGBUILD or git. The exact official ELF is preserved
with stripping and debug-package generation disabled.

The launcher installs and updates mutable licensed game files under
`${XDG_DATA_HOME:-$HOME/.local/share}/Crystal Sol/game`. Its staging and previous
versions stay beside that folder. Credentials stay under
`${XDG_STATE_HOME:-$HOME/.local/state}/crystal-sol-launcher`; settings stay under
`${XDG_CONFIG_HOME:-$HOME/.config}/crystal-sol`. Saves, logs, caches, and downloaded
game content are per-user and are not package-owned.

The launcher needs a terminal and an available browser for account sign-in.
The separately downloaded game needs a working native X11 or Wayland desktop,
graphics drivers, and sound support. WSL package validation is useful, but cannot
prove ordinary native Arch desktop rendering, audio, browser sign-in, or session
lifecycle behavior. Never copy WSL-specific display/socket paths into this package.

The license notice explicitly records that the official launcher archive provides
no standalone EULA or redistribution grant. It must not be read as granting rights.
The game remains subject to upstream license authorization and download policy.

Validate with `makepkg --printsrcinfo`, `makepkg`, `namcap PKGBUILD`,
`namcap crystal-sol-bin-*.pkg.tar.zst`, `pacman -Qlp crystal-sol-bin-*.pkg.tar.zst`,
and `git diff --check`. Do not push until review and native desktop checks finish.

Release validation (0.1.10-1, 2026-10-06): clean Arch WSL package build,
package inspection, local installation, integrity, both launcher command startup
checks, and signed-out installation denial passed. Namcap reported no errors;
warnings concern retained symbols, the ELF loader, and browser-use xdg-utils.
The maintainer explicitly authorized publication with real signed-in entitlement
tests, installed launch-failure diagnostics, and native desktop checks remaining.
Those checks are not claimed as passed.
