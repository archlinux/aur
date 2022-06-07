# Maintainer: Tim Paik <timpaik@163.com>
pkgname=srv-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Http dev server written in Rust"
arch=('x86_64')
url="https://github.com/Tim-Paik/srv"
license=('MPL2')
source=("srv-x86_64-v${pkgver//_/-}.tar.gz::https://github.com/Tim-Paik/srv/releases/download/v${pkgver/_/-}//srv-v${pkgver/_/-}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('65c362aa9458614eb7500df507abb7773c21f5471d982a459955e0862f3083b2')
package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/srv"
}
