# Maintainer: Luke Short <ekultails@gmail.com>
pkgname=curl-static-bin
pkgver=8.20.0
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
sha256sums_x86_64=('7a12a4c460967e769fad9ddae2de4fce6679633b5a1891628e657dad8df57f3d')
sha256sums_aarch64=('b5dde6790a33f55dee04e965d5b0fcd9c82493b72e1e5608c09ce1483359fb81')

package() {
  cd "$srcdir/"
  install -Dm755 curl "${pkgdir}/usr/bin/curl-static"
}
