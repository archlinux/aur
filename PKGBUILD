pkgname=zep-bin
pkgver=1.2.0
pkgrel=7
pkgdesc="Fast package manager for Zig (binary release)"
arch=('x86_64')
url="https://github.com/XerWoho/zeP"
license=('GPLv3')
provides=('zep')
conflicts=('zep')
source=("https://zep.run/releases/${pkgver}/zep_x86_64-linux_${pkgver}.tar.xz")
sha256sums=('4713b33b59e0fe627e6aebe5ab202043da83c32b76fd710262b1c265efd28616')

package() {
    install -Dm755 "$srcdir/zep" "$pkgdir/usr/bin/zep"
}
