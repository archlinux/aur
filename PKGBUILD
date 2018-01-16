# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=editphotos
pkgver=0.4
pkgrel=1
pkgdesc="displays thumbnails of JPEG files and enables to alter the orientation EXIF tag and comments."
# url="http://freshmeat.net/projects/editphotos/"
url="https://github.com/jose1711/editphotos"
arch=('any')
license=('GPL')
depends=('perl' 'perl-image-metadata-jpeg' 'perl-tk')
#source=(http://freshmeat.net/redir/editphotos/53321/url_tgz/$pkgname-$pkgver.tar.gz)
#source=(http://cbouvi.free.fr/download/$pkgname/$pkgname-$pkgver.tar.gz)
source=(https://github.com/jose1711/editphotos/archive/v${pkgver}.tar.gz)
md5sums=('2b8acad0345aa202d50abe5b236ba1f9')

package() {
  cd $srcdir/$pkgname-$pkgver/bin
  install -D -m755 editphotos $pkgdir/usr/bin/editphotos
}
