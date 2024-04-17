# Maintainer: Simon Friis Vindum <simonfv at gmail dot com>

pkgname=projectdo
pkgver=0.2.1
pkgrel=1
pkgdesc="Context-aware single-letter project commands to speed up your terminal workflow."
arch=('any')
url="https://github.com/paldepind/projectdo"
license=('GPL-3.0-or-later')
depends=()

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/paldepind/projectdo/archive/v${pkgver}.tar.gz")
sha256sums=('329b8abf29e19dc7ab524277974d011e72383db2dace0c7baccf8b201a669b4a')

package() {
  install -D "$srcdir/${pkgname}-${pkgver}/projectdo" "$pkgdir/usr/bin/projectdo"
}
