# Maintainer: Adam Havelka <me@uxes.cz>

pkgname=jcloisterzone5
pkgver=5.0.14
pkgrel=1
pkgdesc='A Java version of the Carcassonne board game.'
arch=('any')
url="http://jcloisterzone.com/en/"
license=('AGPL')
depends=('java-runtime>=11' 'nodejs>=12.13.0')
conflicts=('jcloisterzone')
source=("https://github.com/farin/JCloisterZone-Client/releases/download/v${pkgver}/jcloisterzone-${pkgver}.deb")
sha256sums=('9192426dbd61af74017fd5297e45eed31b42c5f9b283b2d176c9918a63d66bbd')
options=('!strip')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
}
