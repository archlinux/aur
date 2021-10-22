# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>
pkgname=envoyproxy-bin
provides=(envoyproxy)
conflicts=(envoyproxy)
pkgver=1.20.0
pkgrel=1
pkgdesc="An open source edge and service proxy, designed for cloud-native applications"
arch=('x86_64')
url="https://envoyproxy.io"
license=('Apache2')
source=(
  "https://archive.tetratelabs.io/envoy/download/v$pkgver/envoy-v$pkgver-linux-amd64.tar.xz"
)
sha512sums=('a633716b5f0c982de5cb18284045998263521d6f8841d134f1521f07a311699a6d9cc2677385bdbc51bed3192c1e9a3a6d1fc9a3c265926659ac38cb3bd11f07')

package() {
  install -d "$pkgdir/usr/bin"
  install -m755 "$srcdir/envoy-v$pkgver-linux-amd64/bin/envoy" "$pkgdir/usr/bin/envoy"
}
