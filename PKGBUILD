# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=aws-lanes
pkgver=0.2.1
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
  "17030d6bb783cbcc9b2e5961abbb62a730d737611573cdd2502bb7ba20ea6864"
  "cf03ea3ea781a1e6291c16bebe5424b122dc0a996b4807f9f9c5909838909613"
)
options=(!strip)

package() {
  install -Dm755 ../lanes_linux_amd64 "${pkgdir}/usr/bin/lanes"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et ai:
