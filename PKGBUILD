# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=cropgui
arch=('any')
pkgver=0.4
pkgrel=1
pkgdesc="a simple tool for lossless jpeg cropping"
license=('GPL')
url="https://github.com/jepler/cropgui"
depends=('libjpeg' 'python-pillow' 'imagemagick' 'pygtk' 'perl-image-exiftool')
source=("https://github.com/jepler/cropgui/archive/v${pkgver}.tar.gz")
md5sums=('a761991bf98793da29390f960dffe9a2')

package() {
  cd $srcdir/$pkgname-$pkgver
  ./install.sh -f gtk -t $pkgdir -p /usr -P /usr/bin/python
}
