# Maintainer: Caleb Maclennan <caleb@alerque.com>
pkgname=freecheck
pkgver=0.30
pkgrel=1
pkgdesc="A free check printing application"
epoch=
arch=(x86_64 i686 armv6h)
url="https://github.com/alerque/freecheck"
license=('GPL')
groups=()
depends=(perl gnumicr)
source=(https://github.com/alerque/freecheck/archive/v0.30.tar.gz)
md5sums=('6c7f7707962329a61bc56ce739178a61')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm644 freecheck.cfg "$pkgdir/etc/freecheck/freecheck.cfg"
  install -Dm755 freecheck "$pkgdir/usr/bin/freecheck"
}

# vim:set ts=2 sw=2 et:
