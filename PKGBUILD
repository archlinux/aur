# Maintainer: hackia <hackia at eytukan dot com>

pkgname="rei"
pkgver=0.0.0
pkgrel=2
pkgdesc="rei"
arch=('any')
url="https://github.com/kireidowa/rei"
license=('AGPL-3.0-or-later')
depends=('cmake')
provides=('rei')
source=("https://github.com/kireidowa/rei/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('aa461da87dde6a7c077bea460c9a2122d4f8ff6476f521a5d703e29dbed83548412af3df3ce32a52a6eabde8a2c7d00d5f361c9f8dcbaf9bfe697b1987a749f0')

package() {
  cd "$pkgname-$pkgver"
  cmake . && make && sudo make install
}

