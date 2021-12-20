# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=cropgui
arch=('any')
pkgver=0.6
pkgrel=1
pkgdesc="a simple tool for lossless jpeg cropping"
license=('GPL')
url="https://github.com/jepler/cropgui"
depends=('libjpeg' 'python-pillow' 'imagemagick' 'python-gobject' 'gtk3' 'perl-image-exiftool')
source=("https://github.com/jepler/cropgui/archive/v${pkgver}.tar.gz")
md5sums=('337ba42c302793620b68085f88a28498')

package() {
  cd $srcdir/$pkgname-$pkgver
  ./install.sh -f gtk -t $pkgdir -p /usr -P /usr/bin/python
}
