# Maintainer: solsTiCe d'Hiver <solstice.dhiver@gmail.com>
# Contributor: Katherine J. Cumberbatch <stykers@stykers.moe>
pkgname=binfmt-qemu-static
pkgver=20220907
pkgrel=1
pkgdesc="Register qemu-static interpreters for various binary formats"
arch=('x86_64')
url="http://www.freedesktop.org/software/systemd/man/binfmt.d.html"
license=('GPL')
optdepends=('qemu-user-static')
source=("qemu-static.conf")
sha256sums=('4a9a23a02e20651791a5e5feca5872b8f0c85537cba21fc0b58af6d325dca46b')

package() {
  install -Dm 644 "$srcdir/qemu-static.conf" "$pkgdir/usr/lib/binfmt.d/qemu-static.conf"
}

# vim:set ts=2 sw=2 et:
