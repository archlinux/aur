# Maintainer: hackia <hackia at eytukan dot com>

pkgname="do"
pkgver=0.0.0
pkgrel=3
pkgdesc="do"
arch=('any')
url="https://github.com/kireidowa/do"
license=('AGPL-3.0-or-later')
depends=('cmake')
provides=('do')
source=("https://github.com/kireidowa/do/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('4727a1be3d3b9f4f7d37a05a84e16d1b249c3b712d16764024efe456110ad4cc7ba0b5057e5224eb11787977016c2b1f9bc2ad3bf574ea239097dee18e53c36c')

package() {
  cd "$pkgname-$pkgver"
  cmake . && make && sudo make install
}

