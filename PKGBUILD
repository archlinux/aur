# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=editphotos
pkgver=0.3
pkgrel=3
pkgdesc="displays thumbnails of JPEG files and enables to alter the orientation EXIF tag and comments."
url="http://freshmeat.net/projects/editphotos/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('perl' 'perl-image-metadata-jpeg' 'perl-tk')
#source=(http://freshmeat.net/redir/editphotos/53321/url_tgz/$pkgname-$pkgver.tar.gz)
#source=(http://cbouvi.free.fr/download/$pkgname/$pkgname-$pkgver.tar.gz)
source=(https://dl.dropboxusercontent.com/u/29095940/oss/${pkgname}-${pkgver}.tar.gz)
md5sums=('a8844964513424a8243f0edd9627301e')

build() {
true
}

package() {
  cd $srcdir/$pkgname-$pkgver/bin
  install -D -m755 editphotos $pkgdir/usr/bin/editphotos
}
