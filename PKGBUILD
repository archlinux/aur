# Maintainer: haliax
pkgname=fcount
pkgver=0.3
pkgrel=1
pkgdesc="Counts the number of files in a directory"
arch=('i686' 'x86_64')
url="http://git.z3bra.org/cgit.cgi/fcount"
license=('WTFPL')
source=("http://git.z3bra.org/cgit.cgi/$pkgname/snapshot/$pkgname-$pkgver.tar.bz2")
md5sums=('b5ad91c216eb3d0eddc9db7bf2e7ccb7')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -D -m0755 fcount $pkgdir/usr/bin/fcount
}
