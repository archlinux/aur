# Maintainer: hackia <hackia at eytukan dot com>

pkgname="shin"
pkgver=0.0.0
pkgrel=1
pkgdesc="shin"
arch=('any')
url="https://github.com/kireidowa/shin"
license=('AGPL-3.0-or-later')
depends=('cmake')
provides=('shin')
source=("https://github.com/kireidowa/shin/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('7b505c28e4bcb47f5fd3ca2556591e61c7613feb7d03bf8f203441339b255da833be505d9e0225031f2b3f05b9717f1a43f921c624ad1e467e9fd6e02c094357')

package() {
  cd "$pkgname-$pkgver"
  cmake . && make && sudo make install
}

