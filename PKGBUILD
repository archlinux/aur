# Maintainer: Katherine J. Cumberbatch <stykers@stykers.moe>
pkgname=binfmt-qemu
pkgver=20210922
pkgrel=1
pkgdesc="Register qemu interpreters for various binary formats"
arch=('any')
url="http://www.freedesktop.org/software/systemd/man/binfmt.d.html"
license=('GPL')
optdepends=('qemu-user')
source=("qemu.conf")
md5sums=('e2069c1bf6bfdb5a075e0ad7043c7ffb')

package() {
  install -Dm 644 "$srcdir/qemu.conf" "$pkgdir/usr/lib/binfmt.d/qemu.conf"
}

# vim:set ts=2 sw=2 et:
