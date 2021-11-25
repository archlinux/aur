# Maintainer Vincent Schweiger <vincent.schweiger@xolley.de>

pkgname=easyaur
pkgver=1.4
pkgrel=1
pkgdesc="Easy-to-use wrapper useful for building packages and managing custom repositories"
url="https://github.com/legendary-cookie/easyaur"
license=('GPL')
source=(
    "https://github.com/legendary-cookie/easyaur/archive/refs/tags/$pkgver.tar.gz"
)
arch=('any')
sha256sums=('31a5a11a3c7c8d72ee0ef7fdcf404432db98b1b6aba8ec8eb9609f2abc95449c')
depends=(
	asp git pacman bash
)

package() {
  install -D -t "$pkgdir/usr/bin" "$srcdir/$pkgname-$pkgver/easyaur"
}

#vim: syntax=sh
