# Maintainer: Cedric Meury <cedric@meury.com>
pkgname=zookeepercli
pkgver=1.0.10
pkgrel=1
pkgdesc="Simple, lightweight, dependable CLI for Apache ZooKeeper"
arch=('x86_64')
url="https://github.com/outbrain/zookeepercli"
license=('GPL')
depends=('glibc')
source=(https://github.com/outbrain/$pkgname/releases/download/v$pkgver/$pkgname)
md5sums=('61d90243fb66ef6d423cbe5923f63c2a')

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/$pkgname $pkgdir/usr/bin
  chmod 755 $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
