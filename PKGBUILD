# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>
pkgname=envoyproxy-bin
provides=(envoyproxy)
conflicts=(envoyproxy)
pkgver=1.19.1
pkgrel=1
pkgdesc="An open source edge and service proxy, designed for cloud-native applications"
arch=('x86_64')
url="https://envoyproxy.io"
license=('Apache2')
source=(
  "https://archive.tetratelabs.io/envoy/download/v1.19.1/envoy-v1.19.1-linux-amd64.tar.xz"
)
sha512sums=('c52c000416c896be7026e9e8a26018a672be8985645a87e1993bdc9320b55a29ff528e4a847041404f8f8ad0da130fa2c978279270fa36e351e01d91f6cd1760')

package() {
  install -d "$pkgdir/usr/bin"
  install -m755 "$srcdir/envoy-v1.19.1-linux-amd64/bin/envoy" "$pkgdir/usr/bin/envoy"
}
