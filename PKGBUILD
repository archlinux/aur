# Maintainer: Carsten Feuls (DL1CAF) 'Der Techniker' <dl1caf@vfdb.org>
# Contributer: Carsten Feuls (DL1CAF) 'Der Techniker' <dl1caf@vfdb.org>
# Contributer: Amateurfunk Station der Hochschule Niederrhein (DF0FN) <df0fn@hs-niederrhein.de>
pkgname=('svxlink-sounds-en_us-heather-16k')
pkgver="13.12"
pkgrel=3
arch=('any')
url="http://sourceforge.net/projects/svxlink/"
license=('GPL')
pkgdesc="Sound Package en_US-heather-16k from svxlink in high quality"
depends=('svxlink')
replaces=('sounds-en_us-heather-16k')
provides=('svxlink-sounds')
source=("${pkgname}-${pkgver}.tar.bz2::https://github.com/sm0svx/svxlink-sounds-en_US-heather/releases/download/14.08/svxlink-sounds-en_US-heather-16k-${pkgver}.tar.bz2")
sha256sums=('26c19d7019d22bac1b5deb49fe7b2197ec5ca7b16daa02ec1d0a058a926f5c69')

package(){
  mkdir -p "${pkgdir}/usr/share/svxlink/sounds/en_US"
  cd "${srcdir}/en_US-heather-16k"
  cp -a * "${pkgdir}/usr/share/svxlink/sounds/en_US"
  touch "${pkgdir}/usr/share/svxlink/sounds/en_US/${pkgname}-${pkgver}"
}
