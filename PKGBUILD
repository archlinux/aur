#PKGBUILD mantainer: JKA Network <contacto@jkanetwork.com>
pkgname=manpages-es
pkgver=1.55
pkgrel=3
pkgdesc="manpages básicas del sistema traducidas al castellano"
arch=('any')
url="https://launchpad.net/ubuntu/+source/manpages-es"
license=('custom')
options=(!emptydirs)
install="$pkgname.install"
source=(https://launchpad.net/ubuntu/+archive/primary/+files/manpages-es_1.55.orig.tar.gz)
sha256sums=('5525558697463e107fa93e4a2275019966478dcae9f30a0f880537b9ee6de8b5')
PKGEXT=".pkg.tar.xz"
build(){
  cd "$srcdir/$pkgname-$pkgver.orig"
  make gz

}
package(){
  cd "$srcdir/$pkgname-$pkgver.orig"
  make install prefix=$pkgdir
}

