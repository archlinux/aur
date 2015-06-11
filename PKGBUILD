# Maintainer: Carsten Feuls (DL1CAF) 'Der Techniker' <dl1caf@vfdb.org>
# Contributer: Carsten Feuls (DL1CAF) 'Der Techniker' <dl1caf@vfdb.org>
# Contributer: Amateurfunk Station der Hochschule Niederrhein (DF0FN) <df0fn@hs-niederrhein.de>
pkgname=('svxlink-sounds-en_us-heather-8k')
pkgver="13.12"
pkgrel=2
arch=('any')
url="http://sourceforge.net/projects/svxlink/"
license=('GPL')
pkgdesc="Sound Package en_US-heather from svxlink in medium quality"
depends=('svxlink')
replaces=('sounds-en_us-heather')
provides=('svxlink-sounds')
source=("${pkgname}-${pkgver}.tar.bz2::https://github.com/sm0svx/svxlink-sounds-en_US-heather/releases/download/14.08/svxlink-sounds-en_US-heather-8k-${pkgver}.tar.bz2")
sha256sums=('dbd21caa2042d24f15ba056e9dfc2a9938c42e2f57162b0820eee94876ccc538')

package(){
  mkdir -p "${pkgdir}/usr/share/svxlink/sounds/en_US"
  cd "${srcdir}/en_US-heather-8k"
  cp -a * "${pkgdir}/usr/share/svxlink/sounds/en_US"
  touch "${pkgdir}/usr/share/svxlink/sounds/en_US/${pkgname}-${pkgver}"
}
