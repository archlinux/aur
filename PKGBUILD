# Maintainer: Robert Ulmer <arch.x@frontexperts.com>
pkgname=every_shell_script
pkgver=20251203
pkgrel=1
license=('GPL')
arch=(any)
source=(https://github.com/hifigraz/$pkgname/archive/refs/tags/$pkgver.tar.gz)

build() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir"
}
package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir"/usr install
}

sha256sums=('ecf1239861f49b26f93fdcd0cab3fb49636ced6e4970a95cf4c21cf8031ebc74')
