# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=editphotos
pkgver=0.3
pkgrel=4
pkgdesc="displays thumbnails of JPEG files and enables to alter the orientation EXIF tag and comments."
# url="http://freshmeat.net/projects/editphotos/"
url="https://github.com/jose1711/editphotos"
arch=('any')
license=('GPL')
depends=('perl' 'perl-image-metadata-jpeg' 'perl-tk')
#source=(http://freshmeat.net/redir/editphotos/53321/url_tgz/$pkgname-$pkgver.tar.gz)
#source=(http://cbouvi.free.fr/download/$pkgname/$pkgname-$pkgver.tar.gz)
source=(https://github.com/jose1711/editphotos/archive/${pkgver}.tar.gz)
md5sums=('e453d8c3508337fea24eb8a3c5c0e2b8')

package() {
  cd $srcdir/$pkgname-$pkgver/bin
  install -D -m755 editphotos $pkgdir/usr/bin/editphotos
}
