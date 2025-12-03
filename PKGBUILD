# Maintainer: Robert Ulmer <arch.x@frontexperts.com>
pkgname=every_shell_script
pkgver=20251203
pkgrel=1
license=[  "any-OSI" ]
arch=(any)
source=(https://github.com/hifigraz/$pkgname/archive/refs/tags/$pkgver.tar.gz)

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

sha256sums=('539b0677c1bd89d6744a405f8de76c19dfeacfc6bf4d1d4325bd96167866758a')
