# Maintainer: OverShifted <prowidgs@gmail.com>
# Contributor: nlsdt <nlsdt@nlsdt.cc>

pkgname=simple-http-server-bin
pkgver=0.6.13
pkgrel=1
pkgdesc='Simple http server in Rust'
arch=('x86_64')
url='https://github.com/TheWaWaR/simple-http-server'
license=('MIT')
depends=('openssl-1.1' 'gcc-libs')
conflicts=('simple-http-server-git' 'simple-http-server')
provides=('simple-http-server-git' 'simple-http-server')
source=("$url/releases/download/v$pkgver/$CARCH-unknown-linux-musl-simple-http-server")
sha256sums=('08951d8e998d97dc4a35cb9376c888b98fa5dfb3dbf03d2fc96299403fd00422')

package() {
	install -Dm755 "$srcdir/$CARCH-unknown-linux-musl-simple-http-server" "$pkgdir/usr/bin/simple-http-server"
}
