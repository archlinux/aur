# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=binfmt-qemu-static
pkgver=20141225
pkgrel=1
pkgdesc="Register qemu-static interpreters for various binary formats"
arch=('any')
url="http://www.freedesktop.org/software/systemd/man/binfmt.d.html"
license=('GPL')
optdepends=('qemu-static')
source=("qemu-static.conf")
md5sums=('dc2f9cb860076d867d81673e346723e0')

package() {
  install -Dm 644 "$srcdir/qemu-static.conf" "$pkgdir/usr/lib/binfmt.d/qemu-static.conf"
}

# vim:set ts=2 sw=2 et:
