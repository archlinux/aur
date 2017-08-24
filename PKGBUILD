# Maintainer:	Ross Whitfield <whitfieldre@ornl.gov>
# Contributor:	Brian Lam <blamm9[at]gmail[dot]com>
# Contributor:	AG_Caesar <caesar[at]drachenhain[dot]net>
# Contributor:	Jan Oliver Oelerich <janoliver[at]oelerich[dot]org>
pkgname=ovito
pkgver=2.9.0
pkgrel=1
pkgdesc="A scientific visualization and analysis software for atomistic simulation data."
url="http://www.ovito.org"
arch=('x86_64')
license=('GPL3')
depends=('python' 'qt5-svg' 'ffmpeg2.8')
conflicts=('ovito-git')
md5sums=('65f8eb93e96145c556e9b04499f924b0')
source=("http://www.ovito.org/download/$pkgver/$pkgname-$pkgver-$CARCH.tar.gz")

package() {
  cd ${pkgname}-${pkgver}-$CARCH
  install -d ${pkgdir}/usr
  rm -rf LICENSE.txt README.txt
  cp -dpr --no-preserve=ownership ./* ${pkgdir}/usr
}
