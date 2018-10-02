# Contributor: Claude Bulin <xcfaudio[at]gmail[dot]com>
# Maintainer: aaditya <aaditya_gnulinux[at]zoho[dot]com>

pkgname=timeset
pkgver=1.6
pkgrel=1
pkgdesc="A script for managing system date and time."
url="https://github.com/aadityabagga/timeset"
arch=('any')
license=('GPL')
depends=('bash' 'ntp')
optdepends=('ntp-openrc: openrc ntp service')
source=("https://github.com/aadityabagga/timeset/archive/${pkgver}.tar.gz")
sha1sums=('3be0d2c86657c2a8d268463c4d2f90206d55ccda')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
