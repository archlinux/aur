# Maintainer: Mike Swanson

pkgname=glibc-i18n-eo
pkgver=1
pkgrel=1
pkgdesc="Esperanto locale for glibc"
arch=('any')
url="http://packages.debian.org/sid/locales"
license=('GPL2')
install=glibc-i18n-eo.install
source=(eo)
sha256sums=('42dd4ba3fec33ceef2e3545b682ddb1d2fdb7200fe079b214008b5563d4c264c')

package() {
  install -Dm644 eo "$pkgdir/usr/share/i18n/locales/eo"
}
