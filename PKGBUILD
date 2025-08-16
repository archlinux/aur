# Maintainer: Luke Short <ekultails@gmail.com>
pkgname=curl-static-bin
pkgver=8.15.0
pkgrel=1
pkgdesc='Static musl-compiled curl with the latest features enabled'
url='https://github.com/stunnel/static-curl'
source_x86_64=("https://github.com/stunnel/static-curl/releases/download/$pkgver/curl-linux-x86_64-musl-$pkgver.tar.xz")
source_aarch64=("https://github.com/stunnel/static-curl/releases/download/$pkgver/curl-linux-aarch64-musl-$pkgver.tar.xz")
arch=('x86_64' 'aarch64')
license=('MIT')
depends=()
conflicts=('curl-static')
provides=('curl-static')
sha256sums_x86_64=('a6e519f459e3c64984f821dd23e144a4657a045de1a4c89f2e4a80ab41b40ed1')
sha256sums_aarch64=('781aac12f0fc8738188e8cf990bb7ad1e9e4fca8fdce4bf4dfbde7756fffb796')

package() {
  cd "$srcdir/"
  install -Dm755 curl "${pkgdir}/usr/bin/curl-static"
}
