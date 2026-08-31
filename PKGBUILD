# Maintainer: Dustin Pilgrim <dustin.pilgrim1997@gmail.com>
#
# Metapackage: pulls in the full Halley Wayland desktop stack.
# Installs the compositor, the native launcher, and the native portal backend.
# `halley` is satisfied by either the stable `halley` or `halley-git` package
# (halley-git provides=halley).

pkgname=halley-full
pkgver=0.7.0
pkgrel=1
pkgdesc="Metapackage: the full Halley Wayland desktop (compositor, launcher, portal)"
arch=('any')
url="https://github.com/saltnpepper97/halley"
license=('GPL-3.0-only')
depends=(
  'halley'
  'halley-lift'
  'xdg-desktop-portal-halley'
)
optdepends=(
  'xorg-xwayland: X11 application support'
  'xdg-desktop-portal-gtk: fallback backend for common file/dialog portals'
  'fuzzel: alternative launcher'
  'ghostty: terminal for the default-terminal binding'
  'kitty: terminal for the default-terminal binding'
  'foot: terminal for the default-terminal binding'
  'wezterm: terminal for the default-terminal binding'
  'alacritty: terminal for the default-terminal binding'
  'wireplumber: provides wpctl for default media-key bindings'
)

package() {
  :
}
