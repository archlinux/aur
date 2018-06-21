# Maintainer: Eric Berquist <eric DOT berquist AT gmail>

pkgname=iqmol
pkgver=2.11.0
pkgrel=1
pkgdesc="A molecular editor and visualization package with Q-Chem integration"
arch=('x86_64')
url="https://iqmol.org"
license=('GPL3')
depends=('qt5-base' 'glu')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}_${pkgver}.deb::http://iqmol.org/download.php?get=${pkgname}_${pkgver}.deb")
md5sums=('11f90cc7d0a1ba9f2cbd4f0ef7c23028')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "${pkgdir}/"
  find "${pkgdir}" -type d -exec chmod 755 '{}' +
}
