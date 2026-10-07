# Crystal Sol binary AUR package

This package installs the official Linux x86-64 launcher only. It does not build
or publish Crystal Sol source code, bypass licensing, or redistribute the game.
Frostal sign-in and a Crystal Sol license are required for the launcher to download
the game. The launcher checks authorized game downloads with SHA-256 and Minisign.

Pacman replaces bootstrap installation. No bootstrap is included. Pacman owns
`/usr/bin/crystal-sol-launcher`, the `crystal-sol` command symlink, desktop entry,
icon, and license notice. Use pacman/AUR updates for the system launcher; upstream
Setup does not manage this package. The desktop entry opens the graphical launcher directly with `Terminal=false`.

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

The graphical launcher needs an X11 or Wayland desktop and an available
browser for account sign-in. Linux draws the launcher without a GPU adapter.
The separately downloaded game needs a working native X11 or Wayland desktop,
graphics drivers, and sound support. WSL package validation is useful, but cannot
prove ordinary native Arch desktop rendering, audio, browser sign-in, or session
lifecycle behavior. Never copy WSL-specific display/socket paths into this package.

The license notice explicitly records that the official launcher archive provides
no standalone EULA or redistribution grant. It must not be read as granting rights.
The game remains subject to upstream license authorization and download policy.

Validate with `makepkg --printsrcinfo`, `makepkg`, `namcap PKGBUILD`,
`namcap crystal-sol-bin-*.pkg.tar.zst`, `pacman -Qlp crystal-sol-bin-*.pkg.tar.zst`,
and `git diff --check`. Review package changes and validation limits before publication.

Release validation (0.1.10-1, 2026-10-06): clean Arch WSL package build,
package inspection, local installation, integrity, both launcher command startup
checks, and signed-out installation denial passed. Namcap reported no errors;
warnings concern retained symbols, the ELF loader, and browser-use xdg-utils.
The maintainer explicitly authorized publication with real signed-in entitlement
tests, installed launch-failure diagnostics, and native desktop checks remaining.
Those checks are not claimed as passed.

Launcher 0.1.11 switches Linux normal startup to the same graphical window as
Windows. There is no terminal fallback. The exact released executable is tested
under Xvfb/software rendering without a terminal; native GPU, audio, and browser
OAuth behavior remain outside that check. The existing authorization and
private game installation flow is unchanged.

Package 0.1.11-1 was rebuilt cleanly, inspected, installed, and checked with
pacman -Qkk (zero altered files). Both installed command names opened the GUI
under Xvfb without a terminal. Namcap has no errors; display libraries are
loaded dynamically, so its ELF scan reports them as possibly unused. Public
launcher symbols and ELF-loader warnings remain intentional.

Launcher 0.1.12 preserves transparent rounded edges. X11 bounding and input
shapes remove the square backdrop and empty border; Wayland uses premultiplied
alpha. The launcher still needs no GPU adapter. The desktop entry calls
/usr/bin/crystal-sol-launcher directly, avoiding older per-user bootstrap command
shadows. Bootstrap remains outside this package. Native desktop visual checks
and real entitlement account tests remain under the previous publication waiver.
