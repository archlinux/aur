# Maintainer: OverShifted <prowidgs@gmail.com>

pkgname=simple-http-server-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="Simple http server in Rust"
arch=('x86_64')
url="https://github.com/TheWaWaR/simple-http-server"
license=('MIT')
depends=('openssl-1.1' 'gcc-libs')
makedepends=()
conflicts=('simple-http-server-git' 'simple-http-server')
provides=('simple-http-server-git' 'simple-http-server')
source=("https://github.com/TheWaWaR/simple-http-server/releases/download/v$pkgver/$CARCH-unknown-linux-musl-simple-http-server")
sha256sums=('4751f874a79fcb299b15d54cdb96809eb43ad3bca4bd4c2e8bd1ec2217cc929f')

package() {
	install -Dm755 "$srcdir/$CARCH-unknown-linux-musl-simple-http-server" "$pkgdir/usr/bin/simple-http-server"
}
