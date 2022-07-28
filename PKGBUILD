# Maintainer: Tim Paik <timpaik@163.com>
pkgname=srv-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="Http dev server written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/Tim-Paik/srv"
license=('MPL2')
source=("srv-x86_64-v${pkgver//_/-}.tar.gz::https://github.com/Tim-Paik/srv/releases/download/v${pkgver/_/-}/srv-v${pkgver/_/-}-$CARCH-unknown-linux-musl.tar.gz")
sha256sums=('67c917030560d6633735dcd3d900b31ee30caa0ec96d93e8f60795af3c8e266b')
package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/srv"
}
