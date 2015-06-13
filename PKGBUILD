# Maintainer: Rolinh <robinDOThahlingATgw-computingDOTnet>
# Maintainer: SanskritFritz (gmail)

pkgname=devismaker
pkgver=2.5.2
pkgrel=1
pkgdesc="Program that can generate invoices and estimates"
arch=('x86_64' 'i686')
url="http://en.congelli.eu/prog_info_devismaker.html"
license=('GPLv3')
depends=('wxgtk')
source=(http://fr.congelli.eu/directdl/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('bc955acadc7c9abd620c02b3eb545ea1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
