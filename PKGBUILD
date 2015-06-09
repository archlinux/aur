# Contributor: Claude Bulin <xcfaudio[at]gmail[dot]com>
# Maintainer: aaditya <aaditya_gnulinux[at]zoho[dot]com>

pkgname=timeset
pkgver=1.5
pkgrel=4
pkgdesc="A script for managing system date and time."
url="https://github.com/aadityabagga/timeset"
arch=('any')
license=('GPL')
depends=('bash' 'ntp')
optdepends=('ntp-openrc: openrc ntp service')
source=("https://github.com/aadityabagga/timeset/archive/${pkgver}.tar.gz")
sha1sums=('af1abb8bcbd3a37554f305d5282da679ee3d3160')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
