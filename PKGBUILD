# Maintainer: https://codeberg.org/libre-menu-editor/libre-menu-editor/issues

pkgname=libre-menu-editor
pkgver=1.9.3
pkgrel=1
pkgdesc="Customize the menu"
arch=("any")
url="https://codeberg.org/libre-menu-editor/libre-menu-editor"
license=("GPL3")
depends=("python" "python-gobject" "gtk4" "libadwaita" "xdg-utils")
makedepends=("make")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("SKIP")

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
