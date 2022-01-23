# Maintainer Vincent Schweiger <vincent.schweiger@xolley.de>

pkgname=easyaur
pkgver=1.5
pkgrel=1
pkgdesc="Easy-to-use wrapper useful for building packages and managing custom repositories"
url="https://github.com/legendary-cookie/easyaur"
license=('GPL')
source=(
    "https://github.com/legendary-cookie/easyaur/archive/refs/tags/$pkgver.tar.gz"
)
arch=('any')
sha256sums=('0ac714414217f6246a7a85556742ce6b537f88594af034c3ba423e1a8c41a407')
depends=(
	asp git pacman bash
)

package() {
  install -D -t "$pkgdir/usr/bin" "$srcdir/$pkgname-$pkgver/easyaur"
}

#vim: syntax=sh
