# Maintainer: mlm-games <125530737+mlm-games@users.noreply.github.com>
pkgname=ftl-csv-convert-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='Bidirectional converter between Fluent (.ftl) locale trees and a single CSV'
arch=('x86_64')
url="https://github.com/mlm-games/ftl-csv-convert"
license=('MIT OR Apache-2.0')
depends=()
provides=(ftl-csv-convert)
conflicts=(ftl-csv-convert)
source=("${pkgname}-${pkgver}::https://github.com/mlm-games/ftl-csv-convert/releases/download/v${pkgver}/ftl-csv-convert-linux-x86_64")
sha256sums=('e8c5b35ffe315c5d41bb8612057233d40b929edff6d1fad44e13abb153a046e6')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/ftl-csv-convert"
}
