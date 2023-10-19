# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>
pkgname=envoyproxy-bin
provides=(envoyproxy)
conflicts=(envoyproxy)
pkgver=1.15.2
pkgrel=1
pkgdesc="An open source edge and service proxy, designed for cloud-native applications"
arch=('x86_64')
url="https://envoyproxy.io"
license=('Apache2')
source=(
  "https://archive.tetratelabs.io/envoy/download/v$pkgver/envoy-v$pkgver-linux-amd64.tar.xz"
)
sha512sums=('05071a3ab17c57db90837b36e91916080f04c9ab24e5d07fd298fee73ad71b5f2f0ff663ca839f6d1ba47a729ee2a8c0028853af9e3c35666ad42ce20f33bc19')

package() {
  install -d "$pkgdir/usr/bin"
  install -m755 "$srcdir/envoy-v$pkgver-linux-amd64/bin/envoy" "$pkgdir/usr/bin/envoy"
}
