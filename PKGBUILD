# Maintainer: Tim Paik <timpaik@163.com>
pkgname=srv-bin
pkgver=1.0.0_rc.6
pkgrel=1
pkgdesc="Http dev server written in Rust"
arch=('x86_64')
url="https://github.com/Tim-Paik/srv"
license=('MPL2')
source=("https://github.com/Tim-Paik/srv/releases/download/v${pkgver//_/-}/srv-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('18e53a6d121cad557d36c3b02ac9eb2191f91301bda99edebd8ed9439e0f1585')
package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/srv"
}
