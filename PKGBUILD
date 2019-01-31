# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Johnathan Jenkins <twodopeshaggy@gmail.com>

pkgname=aview
pkgver=1.3.0_rc1
pkgrel=3
pkgdesc="a high quality ascii-art image browser"
arch=('i686' 'x86_64')
url="http://aa-project.sourceforge.net/aview/"
license=('GPL')
depends=('aalib')
source=('http://downloads.sourceforge.net/sourceforge/aa-project/aview-1.3.0rc1.tar.gz')
md5sums=('093f298e7787591e229b59d039c72f4d')

build() {
  cd $srcdir/$pkgname-1.3.0
  ./configure --prefix=/usr --mandir=/usr/share/man
  make 
}

package() {
  cd $srcdir/$pkgname-1.3.0
  make prefix=$pkgdir/usr mandir=$pkgdir/usr/share/man install
}
