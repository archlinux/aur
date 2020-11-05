# Maintainer: Adam Havelka <me@uxes.cz>

pkgname=jcloisterzone5
pkgver=5.0.19
pkgrel=1
pkgdesc='A Java version of the Carcassonne board game.'
arch=('any')
url="http://jcloisterzone.com/en/"
license=('AGPL')
depends=('java-runtime>=11' 'nodejs>=12.13.0')
conflicts=('jcloisterzone')
source=("https://github.com/farin/JCloisterZone-Client/releases/download/v${pkgver}/jcloisterzone-${pkgver}.deb")
sha256sums=('3f7f15c8f239ced44d2156f523aec434fc7c8d7e234c007a35245d989965dccc')
options=('!strip')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
}
