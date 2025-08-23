# Maintainer: Simon Friis Vindum <simonfv at gmail dot com>

pkgname=projectdo
pkgver=0.2.3
pkgrel=2
pkgdesc="Context-aware single-letter project commands to speed up your terminal workflow."
arch=('any')
url="https://github.com/paldepind/projectdo"
license=('GPL-3.0-or-later')
depends=()

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/paldepind/projectdo/archive/v${pkgver}.tar.gz")
sha256sums=('0e39ed5b01b37d28331037fe1b07329ec50868123e98a8d7ce5131ced9ab2cc2')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
