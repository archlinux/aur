# Maintainer: Luke Short <ekultails@gmail.com>
pkgname=curl-static-bin
pkgver=8.11.0
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
sha256sums_x86_64=('dde4f793fe38fe095810dc4ad555d6754d76d2624a88ad94a17afb24f570ffaf')
sha256sums_aarch64=('c78a0ed1832f768c699cefb8c74becf04d51056616a94012cdd05d797664a1ed')

package() {
  cd "$srcdir/"
  install -Dm755 curl "${pkgdir}/usr/bin/curl-static"
}
