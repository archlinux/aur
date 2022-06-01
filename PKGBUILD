#Maintainer: aaditya <aaditya_gnulinux@zoho.com>

pkgname=timeset-gui
pkgver=2.4.1
pkgrel=1
pkgdesc="A GUI for managing system date and time."
url="https://github.com/aadityabagga/timeset-gui"
arch=('any')
license=('GPL')
depends=('gksu' 'python-gobject' 'ntp')
optdepends=('ntp-openrc: openrc ntp service')
source=("https://github.com/aadityabagga/timeset-gui/archive/${pkgver}.tar.gz")
sha1sums=('f9add9aa9a90568ca228170576e3b9df87cd2feb')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
