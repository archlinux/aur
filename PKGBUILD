pkgname=binfmt-qemu-loongarch64-static
pkgver=20200413
pkgrel=1
pkgdesc="Register qemu-loongarch64-static interpreters "
arch=('armv5' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url="http://www.freedesktop.org/software/systemd/man/binfmt.d.html"
license=('GPL')
optdepends=('qemu-loongarch64-static')
conflicts=('qemu-loongarch64')
source=("qemu-loongarch64-static.conf")
md5sums=('e90ed3ff046d77e8bbc7db9d13c9e374')

package() {
  install -Dm 644 "$srcdir/qemu-loongarch64-static.conf" "$pkgdir/usr/lib/binfmt.d/qemu-loongarch64-static.conf"
}

