# Maintainer: Tim Paik <timpaik@163.com>
pkgname=srv-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Http dev server written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/Tim-Paik/srv"
license=('MPL2')
source=("srv-x86_64-v${pkgver//_/-}.tar.gz::https://github.com/Tim-Paik/srv/releases/download/v${pkgver/_/-}/srv-v${pkgver/_/-}-$CARCH-unknown-linux-musl.tar.gz")
sha256sums=('887a8235b1089bf6619c028d5cdfef69817910150596f2565acba652490fe710')
package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/srv"
}
