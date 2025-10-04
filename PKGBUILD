# Maintainer: menaouer <chaabi.menaouer@gmail.com>
pkgname=einfach-icon-theme
pkgver=1.0.0
options=('!strip' '!debug')
pkgrel=1
pkgdesc="Simple GTK icon theme with multiple color variants"
arch=('any')
url="https://github.com/DerJimno/einfach-icon-theme"
license=('CC BY-SA 4.0')
depends=()
makedepends=()
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Installer Script
  ./install.sh -a -d "$pkgdir/usr/share/icons"
}
