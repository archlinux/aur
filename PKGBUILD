# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=aws-lanes
pkgver=0.3.0
pkgrel=1
pkgdesc="Utility for interacting with different lanes of servers on AWS."
arch=('x86_64')
url="https://github.com/codekoala/go-aws-lanes"
license=('BSD')
sources=(
  "https://github.com/codekoala/go-aws-lanes/releases/download/v${pkgver}/lanes_linux_amd64"
  "https://github.com/codekoala/go-aws-lanes/raw/v${pkgver}/LICENSE"
)
sha25sums=(
  "48577fa3038e16595cd2945c7bc7ef9d56edc0e6da96c038e5dc294fadda12a0"
  "cf03ea3ea781a1e6291c16bebe5424b122dc0a996b4807f9f9c5909838909613"
)
options=(!strip)

package() {
  install -Dm755 ../lanes_linux_amd64 "${pkgdir}/usr/bin/lanes"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et ai:
