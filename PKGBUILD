# Maintainer Vincent Schweiger <vincent.schweiger@xolley.de>

pkgname=easyaur
pkgver=1.0
pkgrel=1
pkgdesc="Easy-to-use wrapper useful for custom repositories"
url="https://github.com/legendary-cookie/easyaur"
license=('GPL')
source=(
    "https://github.com/legendary-cookie/easyaur/archive/refs/tags/$pkgver.tar.gz"
)
arch=('any')
sha256sums=('8519201b0eee105280a9a71e41f02ea8a5712f7286142d1a7d7fc23d9a4db09d')
depends=(
	asp git pacman bash
)

package() {
  install -D -t "$pkgdir/usr/bin" "$srcdir/$pkgname-$pkgver/easyaur"
}

#vim: syntax=sh
