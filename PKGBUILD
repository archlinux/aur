# Maintainer: Tim Paik <timpaik@163.com>
pkgname=srv-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="Http dev server written in Rust"
arch=('x86_64')
url="https://github.com/Tim-Paik/srv"
license=('MPL2')
source=("srv-x86_64-v${pkgver//_/-}.tar.gz::https://github.com/Tim-Paik/srv/releases/download/v${pkgver/_/-}/srv-v${pkgver/_/-}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('6f12734d2f32fb7d2ebc1d2ec9ee01a0c78c1367f2cbc0c5d756e894ea1be087')
package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/srv"
}
