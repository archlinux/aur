# Maintainer: Luke Short <ekultails@gmail.com>
pkgname=curl-static-bin
pkgver=8.21.0
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
sha256sums_x86_64=('e955f211202ded2536164588331acfc987dc4b7857efa3577717b1ffeab22029')
sha256sums_aarch64=('d3f10502a9c6ead9bc3763fde3d12467db03661a263e11fec2ef2edc70e98e9f')

package() {
  cd "$srcdir/"
  install -Dm755 curl "${pkgdir}/usr/bin/curl-static"
}
