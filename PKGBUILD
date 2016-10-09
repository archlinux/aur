# Maintainer: grimsock <lord.grimsock at gmail dot com>

pkgname=gcp-cups-connector-systemd
pkgver=1.2
pkgrel=1
pkgdesc="Systemd startup script for Google CloudPrint CUPS Connector"
arch=('any')
license=('MIT')
depends=('gcp-cups-connector')
source=('gcp-cups-connector.service')

sha1sums=('2007e9fecbba3f7db40586b2f494dd52f1857ad3')

package() {
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  install -Dm 644 "gcp-cups-connector.service" "${pkgdir}/usr/lib/systemd/system/"
}
