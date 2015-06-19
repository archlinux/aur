# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=mp_doccer
pkgver=1.2.2
pkgrel=1
pkgdesc="C source code documentation generator"
arch=('i686' 'x86_64')
url="http://triptico.com/software/mp_doccer.html"
license=('GPL2')
depends=('perl')
source=("http://triptico.com/download/$pkgname-$pkgver.tar.gz")
md5sums=('fcc04deff7ce456cc7c438a173e5ca8b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  install -m755 -d "$pkgdir/usr/bin"
  make PREFIX="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
