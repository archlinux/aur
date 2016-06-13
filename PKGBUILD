#PKGBUILD mantainer: JKA Network <contacto@jkanetwork.com>
pkgname=manpages-es
pkgver=1.55
pkgrel=1
pkgdesc="Ubuntu manpages translated to spanish"
arch=('any')
url="https://launchpad.net/ubuntu/+source/manpages-es"
license=('custom')
options=(!emptydirs)
source=(https://launchpad.net/ubuntu/+archive/primary/+files/manpages-es_1.55.orig.tar.gz)
md5sums=('13d8e00b7b88ac01d9aff3edbaa692b7')
PKGEXT=".pkg.tar.xz"
build(){
  cd "$srcdir/$pkgname-$pkgver.orig"
  make gz

}
package(){
  cd "$srcdir/$pkgname-$pkgver.orig"
  make prefix=$pkgdir  
}

