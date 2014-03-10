# Maintainer: Caleb Maclennan <caleb@alerque.com>
pkgname=freecheck
pkgver=0.30.1
pkgrel=1
pkgdesc="A free check printing application"
epoch=
arch=(x86_64 i686 armv6h)
url="https://github.com/alerque/freecheck"
license=('GPL')
groups=()
depends=(perl gnumicr)
source=('https://github.com/alerque/freecheck/archive/installer.tar.gz')
md5sums=('09fe4b90da437fb2592b7ef662eccc7f')

package() {
  cd $srcdir
  cd "$srcdir/$pkgname-installer"

  install -Dm644 freecheck.cfg "$pkgdir/etc/freecheck/freecheck.cfg"
  install -Dm755 freecheck "$pkgdir/usr/bin/freecheck"
}

# vim:set ts=2 sw=2 et:
