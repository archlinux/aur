# Maintainer: PainSan67 <painsan67 [at] proton (dot) me>
# Contributor: jose
# Contributor: eniac
# Contributor: sabitmaulanaa
# Contributor: tdehaeze

pkgname=cropgui
arch=('any')
pkgver=0.9
pkgrel=2
pkgdesc="a simple tool for lossless jpeg cropping"
license=('GPL')
url="https://github.com/jepler/cropgui"
depends=('libjpeg' 'python-pillow' 'imagemagick' 'python-gobject' 'gtk3' 'perl-image-exiftool')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jepler/cropgui/archive/v${pkgver}.tar.gz")

md5sums=('1a73990120dd72f03656b3bcb0150691')

package() {
  cd $srcdir/$pkgname-$pkgver
  ./install.sh -f gtk -t $pkgdir -p /usr -P /usr/bin/python
}
