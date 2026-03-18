# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=atch
pkgver=0.4
pkgrel=1
pkgdesc="Lets you attach and detach terminal sessions"
arch=(x86_64)
url="https://github.com/mobydeck/$pkgname"
license=(GPL-2.0-only)
options=(!debug)
source=($url/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('71abd29923724355425fb4537eb71cf04f5d3e1f0191b33802a1a5b3a6f942d3d44bf5eabed2bb47611c57ab922f85a04a86b78af4026a8d873647853da23bed')

build() {
  cd $pkgname-$pkgver
  make VERSION="$pkgver"
}

package() {
  cd $pkgname-$pkgver
  install -vDm 755 $pkgname   -t "$pkgdir"/usr/bin/
}
