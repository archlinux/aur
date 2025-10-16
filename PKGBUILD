# Maintainer: hackia <hackia at eytukan dot com>
pkgname="arbor"
pkgver=0.0.0
pkgrel=1
pkgdesc="arbor"
arch=('any')
url="https://github.com/hackia/arbor"
license=('AGPL-3.0-or-later')
depends=('cmake')
provides=('arbor')
source=("https://github.com/hackia/arbor/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('f60b91ffe6d423fc061e95a16491381ee5c3ab6f2f86724c123d14637749e42dd56b26da17bccb9acdc4ed868488ced2f404d4272cfe1b8a1bdf2f2061097136')

package() {
  cd "$pkgname-$pkgver"
  cmake . && make && sudo make install
}

