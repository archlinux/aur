# Maintainer: Tim Paik <timpaik@163.com>
pkgname=srv-bin
pkgver=1.0.0_rc.7
pkgrel=1
pkgdesc="Http dev server written in Rust"
arch=('x86_64')
url="https://github.com/Tim-Paik/srv"
license=('MPL2')
source=("https://github.com/Tim-Paik/srv/releases/download/v${pkgver//_/-}/srv-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('cd42796f7a025fd272ecd1d002a6ae3df466be1dcc7bc0571bef5b1097f490d6')
package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/srv"
}
