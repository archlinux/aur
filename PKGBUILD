# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>
pkgname=envoyproxy-bin
provides=(envoyproxy)
conflicts=(envoyproxy)
pkgver=1.25.3
pkgrel=1
pkgdesc="An open source edge and service proxy, designed for cloud-native applications"
arch=('x86_64')
url="https://envoyproxy.io"
license=('Apache2')
source=(
  "https://archive.tetratelabs.io/envoy/download/v$pkgver/envoy-v$pkgver-linux-amd64.tar.xz"
)
sha512sums=('e49cae47ea71ee7c59b608b7fb172871f4766a3c0eb456f0c455f3be4772709d427ffc3eb1cf4717cb29e97c23df3094f13c519df39f4e9490911c67f3605cd1')

package() {
  install -d "$pkgdir/usr/bin"
  install -m755 "$srcdir/envoy-v$pkgver-linux-amd64/bin/envoy" "$pkgdir/usr/bin/envoy"
}
