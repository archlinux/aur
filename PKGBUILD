# Maintainer: grimsock <lord.grimsock at gmail dot com>

pkgname=gcp-cups-connector-systemd
pkgver=1
pkgrel=1
pkgdesc="Systemd startup script for Google CloudPrint CUPS Connector"
arch=('any')
license=('MIT')
depends=('gcp-cups-connector')
source=('gcp-cups-connector.service')

sha1sums=('7029f0475fbe3a1e6cfa0a556ee8320ecb5d6bd4')

package() {
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  install -Dm 644 "gcp-cups-connector.service" "${pkgdir}/usr/lib/systemd/system/"
}
