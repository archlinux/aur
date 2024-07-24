# Maintainer: OverShifted <prowidgs@gmail.com>

pkgname=simple-http-server-bin
pkgver=0.6.9
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
sha256sums=('7ff07cc5379cd573673db8f40018e51bf20de7752f4d1e75482b1af32d6fae3d')

package() {
	install -Dm755 "$srcdir/$CARCH-unknown-linux-musl-simple-http-server" "$pkgdir/usr/bin/simple-http-server"
}
