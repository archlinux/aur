#Maintainer: aaditya <aaditya_gnulinux@zoho.com>

pkgname=timeset-gui
pkgver=2.3
pkgrel=1
pkgdesc="A GUI for managing system date and time."
url="https://github.com/aadityabagga/timeset-gui"
arch=('any')
license=('GPL')
depends=('gksu' 'python2-gobject' 'ntp')
optdepends=('ntp-openrc: openrc ntp service')
source=("https://github.com/aadityabagga/timeset-gui/archive/${pkgver}.tar.gz")
sha1sums=('3546c3fd71940308500a912372ddec8779a4989f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
