# Maintainer: grimsock <lord.grimsock at gmail dot com>

pkgname=gcp-cups-connector-systemd
pkgver=1
pkgrel=2
pkgdesc="Systemd startup script for Google CloudPrint CUPS Connector"
arch=('any')
license=('MIT')
depends=('gcp-cups-connector')
source=('gcp-cups-connector.service')

sha1sums=('4ad03e70d04e744474ea5c80bec3a5c1953c7a6b')

package() {
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  install -Dm 644 "gcp-cups-connector.service" "${pkgdir}/usr/lib/systemd/system/"
}
