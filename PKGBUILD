# Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=ffdiaporama-openclipart
pkgver=0.18
pkgrel=1
pkgdesc="Extension for ffDiaporama to use the openclipart-library"
arch=('any')
url="http://ffdiaporama.tuxfamily.org"
license=('none')
depends=('openclipart-svg')
source=(http://download.tuxfamily.org/ffdiaporama/Packages/Stable/ffdiaporama_openclipart_0.18.2014.0205.tar.gz)
md5sums=('ff8369586c9190368a88db33c5a3a756')

package() {
  mkdir -p $pkgdir/usr/share/ffDiaporama/clipart/openclipart-0.18-svgonly
  ln -s /usr/share/openclipart/svg $pkgdir/usr/share/ffDiaporama/clipart/openclipart-0.18-svgonly/clipart
  install -m644 $srcdir/ffDiaporama_openclipart/*.txt $pkgdir/usr/share/ffDiaporama/clipart
}