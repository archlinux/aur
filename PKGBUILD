#Maintainer: Brian Bidulock <bidulock@openss7.org>
#Contributor: Georgo10 <georgo10 at gmail.com>

pkgname=wmhdplop
pkgver=0.9.9
pkgrel=1
pkgdesc="A dockapp that monitors your hard-drives"
url="http://hules.free.fr/wmhdplop/"
md5sums=('1c81cc9d438587399b6fa539e6021221')
arch=('i686' 'x86_64')
license=('GPL')
depends=('imlib2')
source=("http://hules.free.fr/wmhdplop/$pkgname-$pkgver.tar.gz")
md5sums=('a64337205bc30faa45053965cc957b0e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
