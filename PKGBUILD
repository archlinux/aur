# Maintainer: https://codeberg.org/libre-menu-editor/libre-menu-editor/issues

pkgname=libre-menu-editor
pkgver=1.3
pkgrel=1
pkgdesc="Customize the menu"
arch=("any")
url="https://codeberg.org/libre-menu-editor/libre-menu-editor"
license=("GPL3")
depends=("python" "gtk4" "libadwaita" "xdg-utils")
makedepends=("git" "make")
source=("git+https://codeberg.org/libre-menu-editor/libre-menu-editor")
sha256sums=("SKIP")

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
