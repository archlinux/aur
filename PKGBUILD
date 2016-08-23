# Maintainer: grimsock <lord.grimsock at gmail dot com>

pkgname=gcp-cups-connector-systemd
pkgver=1.1
pkgrel=1
pkgdesc="Systemd startup script for Google CloudPrint CUPS Connector"
arch=('any')
license=('MIT')
depends=('gcp-cups-connector')
source=('gcp-cups-connector.service')

sha1sums=('effd52aa08a03593b3a8cd2017bf61fa4ad31efb')

package() {
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  install -Dm 644 "gcp-cups-connector.service" "${pkgdir}/usr/lib/systemd/system/"
}
