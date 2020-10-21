# Maintainer: Adam Havelka <me@uxes.cz>

pkgname=jcloisterzone5
pkgver=5.0.15
pkgrel=1
pkgdesc='A Java version of the Carcassonne board game.'
arch=('any')
url="http://jcloisterzone.com/en/"
license=('AGPL')
depends=('java-runtime>=11' 'nodejs>=12.13.0')
conflicts=('jcloisterzone')
source=("https://github.com/farin/JCloisterZone-Client/releases/download/v${pkgver}/jcloisterzone-${pkgver}.deb")
sha256sums=('207f0ffa3288f6043c19a98a90ed16dfc440a544dc1b18f68fff3478e645bbd2')
options=('!strip')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
}
