# Maintainer Vincent Schweiger <vincent.schweiger@xolley.de>

pkgname=easyaur
pkgver=1.1
pkgrel=1
pkgdesc="Easy-to-use wrapper useful for building packages and managing custom repositories"
url="https://github.com/legendary-cookie/easyaur"
license=('GPL')
source=(
    "https://github.com/legendary-cookie/easyaur/archive/refs/tags/$pkgver.tar.gz"
)
arch=('any')
sha256sums=('8dec772204ea40b8dfb71de47afdb5690e81a7643dcefb3aae018d32bf6cc45d')
depends=(
	asp git pacman bash
)

package() {
  install -D -t "$pkgdir/usr/bin" "$srcdir/$pkgname-$pkgver/easyaur"
}

#vim: syntax=sh
