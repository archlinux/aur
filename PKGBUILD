pkgname=imagej-plugin-figurecalibration
pkgver=20090812
pkgrel=1
pkgdesc="ImageJ plugin for data extraction from plots only available as images"
arch=(any)
url=http://www.astro.physik.uni-goettingen.de/~hessman/ImageJ/Figure_Calibration/
license=(unknown)
depends=(imagej)
source=("http://www.astro.physik.uni-goettingen.de/~hessman/ImageJ/Figure_Calibration/Figure_Calibration.class")
md5sums=('99b63cb9b6a8a0507d565680fc911bc8')

package() {
        install -D -m 644 "$srcdir/Figure_Calibration.class" "$pkgdir/usr/share/imagej/plugins/Figure_Calibration.class"
}
