# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=libpri
pkgver=1.6.0
pkgrel=1
pkgdesc='library that encapsulates the protocols used to communicate over ISDN Primary Rate Interfaces'
arch=('i686' 'x86_64')
url='http://www.asterisk.org/'
license=('GPL')
depends=('dahdi')
source=("https://downloads.asterisk.org/pub/telephony/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7225ea7ec334a115f9dc08e71f55589c38cb4e00b13964cd2f08cc4e6123e3f6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install 
}
