# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>
pkgname=envoyproxy-bin
provides=(envoyproxy)
conflicts=(envoyproxy)
pkgver=1.29.2
pkgrel=1
pkgdesc="An open source edge and service proxy, designed for cloud-native applications"
arch=('x86_64')
url="https://envoyproxy.io"
license=('Apache2')
source=(
  "https://archive.tetratelabs.io/envoy/download/v$pkgver/envoy-v$pkgver-linux-amd64.tar.xz"
)
sha512sums=('e8f5fb26a4babf8c63d959c0824f070e96cb41a2a56fdc926241692c64aa069d6e5d1557b5b308a3bd0ca1f22fa994411199a03ff5c2cf2c1c55b1ebf9c46f07')

package() {
  install -d "$pkgdir/usr/bin"
  install -m755 "$srcdir/envoy-v$pkgver-linux-amd64/bin/envoy" "$pkgdir/usr/bin/envoy"
}
