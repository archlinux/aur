# Maintainer: Luke Short <ekultails@gmail.com>
pkgname=curl-static-bin
pkgver=8.13.0
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
sha256sums_x86_64=('9f112cae99dd7caf2247c1b562b72eaafe771d346a6ee2b37a400b1c76115eb3')
sha256sums_aarch64=('d4c73d19ab538436526f18ea2545ceb8bd05a5f936d4bbd85f83e1d11ee20749')

package() {
  cd "$srcdir/"
  install -Dm755 curl "${pkgdir}/usr/bin/curl-static"
}
