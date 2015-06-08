# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=libinjection
pkgver=3.9.1
pkgrel=1
pkgdesc="SQL / SQLI tokenizer parser analyzer."
url="https://github.com/client9/libinjection"
arch=('i686' 'x86_64')
license=( 'BSD' )
depends=(  )
options=( "!strip" )
source=( "$pkgname-$pkgver.tar.gz::https://github.com/client9/libinjection/archive/v$pkgver.tar.gz" )
md5sums=('3aedccb303c187645e41a13af2805795')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/share/
  cp -r ./ $pkgdir/usr/share/$pkgname/
  rm -fr $pkgdir/usr/share/pkgname/.git
}
