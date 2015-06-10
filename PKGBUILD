# Maintainer: Jon Ribeiro <contact@jonathas.com>
pkgname=htmlcr
pkgver=0.8.1
pkgrel=1
pkgdesc="htmlcrunch speeds up your HTML pages by removing things that are ignored by browsers anyway, such as superflous blanks, line feeds and comments"
arch=('i686' 'x86_64')
url="http://www.sourcefiles.org/Miscellaneous/htmlcr-0.8.1-src.zip.shtml"
license=('GPL')
depends=('unzip')
makedepends=('gcc')
source=(http://www.sourcefiles.org/Miscellaneous/$pkgname-$pkgver-src.zip)
md5sums=('7ede46804d75ab1d8c368f1e343b3d47')

package() {
  cd $startdir/src/
  gcc htmlcr.c -o htmlcr
  cd $startdir/pkg
  mkdir -p usr/bin
  cp $startdir/src/htmlcr $startdir/pkg/usr/bin/
}


