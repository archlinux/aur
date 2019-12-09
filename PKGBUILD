# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=cropgui
arch=('any')
pkgver=0.3
pkgrel=3
pkgdesc="a simple tool for lossless jpeg cropping"
license=('GPL')
url="https://github.com/jepler/cropgui"
depends=('libjpeg' 'python2-pillow' 'imagemagick' 'pygtk' 'libimage-exiftool-perl')
source=("https://github.com/jepler/cropgui/archive/v${pkgver}.tar.gz")
md5sums=('fd40d5b3b8c106ff6bb149a624fc9683')

package() {
cd $srcdir/$pkgname-$pkgver
./install.sh -f gtk -t $pkgdir -p /usr -P python2
}
