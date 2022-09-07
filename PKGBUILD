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
sha256sums=('e2271db050fe0a224246a437dd269e4efe4b6598049f8917370e654989fe0d31')

package() {
  install -Dm 644 "$srcdir/qemu-static.conf" "$pkgdir/usr/lib/binfmt.d/qemu-static.conf"
}

# vim:set ts=2 sw=2 et:
