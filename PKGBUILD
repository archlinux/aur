# Contributor: Andrey Semenov <russianpirate@gmail.com>
# Edited and adopted for pidgin by Xaaser <Xaaser2006@rambler.ru>

pkgname=guifications-clearlooks2glo
pkgver=1.0
pkgrel=3
arch=('any')
pkgdesc="Clearlooks2 GLO themes for guifications"
url="http://kdyne.net/projekty/guifications/index.php?section=get"
license="GPL"
depends=('pidgin' 'guifications')
source=(http://kdyne.net/projekty/guifications/download.php?fileName=cl2glo-$pkgver-noarch.tar.gz)
md5sums=('e6b216fcfdd0088b719db2474967265b')

package() {
  mkdir -p $pkgdir/usr/share/pixmaps/pidgin/guifications/themes
  cp -R $srcdir/Clearlooks2-GLO/data/* $pkgdir/usr/share/pixmaps/pidgin/guifications/themes/
}

