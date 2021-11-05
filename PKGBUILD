# Maintainer: Jonathan Vogel <jonaobervogel@gmail.com>

pkgname=gnome-shell-extension-arcmenu
pkgver=1
pkgrel=18
pkgdesc="ArcMenu - Application Menu Extension for GNOME"
arch=('any')
url="https://gitlab.com/arcmenu/ArcMenu"
license=('GPL')
makedepends=('gettext')
depends=('gnome-shell' 'gnome-menus' 'xdg-utils')
optdepends=(
)
source=(https://gitlab.com/arcmenu/ArcMenu/-/archive/v18/ArcMenu-v$pkgrel.tar.gz)
sha256sums=('5ed750fc189c5a69d7a6545e45e981e1998207afe60256c4389d54423426e827')

package() {
  cd ArcMenu-v$pkgrel
  make DESTDIR="$pkgdir/" install
}

