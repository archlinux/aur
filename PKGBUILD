# Maintainer: jose <jose1711 [at] gmail (dot) com>
# Contributor: eniac
# Contributor: sabitmaulanaa
# Contributor: tdehaeze

pkgname=cropgui
arch=('any')
pkgver=0.7
pkgrel=1
pkgdesc="a simple tool for lossless jpeg cropping"
license=('GPL')
url="https://github.com/jepler/cropgui"
depends=('libjpeg' 'python-pillow' 'imagemagick' 'python-gobject' 'gtk3' 'perl-image-exiftool')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jepler/cropgui/archive/v${pkgver}.tar.gz")

md5sums=('af229e7a38afbbb0a560ed9492bf978f')

package() {
  cd $srcdir/$pkgname-$pkgver
  ./install.sh -f gtk -t $pkgdir -p /usr -P /usr/bin/python
}
