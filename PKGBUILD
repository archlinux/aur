# Maintainer: hackia <hackia at eytukan dot com>

pkgname="ki"
pkgver=0.0.0
pkgrel=3
pkgdesc="ki"
arch=('any')
url="https://github.com/kireidowa/ki"
license=('AGPL-3.0-or-later')
depends=('cmake')
provides=('ki')
source=("https://github.com/kireidowa/ki/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('c8fa21e03c7f9b0a4025a1077501a4b42616e168aca52fe7076c8bbd1827f677dd5934a836b1378aba1200bc7e6fd5d5a86f2b79f4fd1cdb1d8b556ce8e3d60f')

package() {
  cd "$pkgname-$pkgver"
  cmake . && make && sudo make install
}

