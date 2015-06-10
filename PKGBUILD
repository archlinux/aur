# $Id: PKGBUILD 90452 2013-05-12 16:50:06Z bluewind $
# Maintainer: Florian Pritz <flo@xinu.at>
# Contributor: Cainã Costa <cainan.costa@gmail.com>

pkgname=lxnm
pkgver=0.2.2
pkgrel=4
pkgdesc="A Network Manager (Part of LXDE)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://lxde.org"
depends=('glib2')
source=("http://downloads.sourceforge.net/sourceforge/lxde/${pkgname}-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}

md5sums=('2ee64e5fad4a27a522f1eb2da08dd46a')
