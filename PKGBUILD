# Maintainer: Cedric Meury <cedric@meury.com>
pkgname=zookeepercli
pkgver=1.0.12
pkgrel=1
pkgdesc="Simple, lightweight, dependable CLI for Apache ZooKeeper"
arch=('x86_64')
url="https://github.com/outbrain/zookeepercli"
license=('GPL')
depends=('glibc')
source=(https://github.com/outbrain/$pkgname/releases/download/v$pkgver/$pkgname-linux-amd64-binary.tar.gz)
sha256sums=('003b15110ec4c939d885eda5e31f3859148f963c6f490596d8de275b09d26d0c')

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/$pkgname $pkgdir/usr/bin
  chmod 755 $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
