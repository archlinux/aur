# Maintainer: Adam Havelka <me@uxes.cz>

pkgname=jcloisterzone5
pkgver=5.0.18
pkgrel=1
pkgdesc='A Java version of the Carcassonne board game.'
arch=('any')
url="http://jcloisterzone.com/en/"
license=('AGPL')
depends=('java-runtime>=11' 'nodejs>=12.13.0')
conflicts=('jcloisterzone')
source=("https://github.com/farin/JCloisterZone-Client/releases/download/v${pkgver}/jcloisterzone-${pkgver}.deb")
sha256sums=('d9e85ad72df04588b060888324f6dc9db06d1c66ac03ede5e87fbd9ef369cf4b')
options=('!strip')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
}
