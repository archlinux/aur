# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=aws-lanes
pkgver=0.3.1
pkgrel=1
pkgdesc="Utility for interacting with different lanes of servers on AWS."
arch=('x86_64')
url="https://github.com/codekoala/go-aws-lanes"
license=('BSD')
source=(
  "https://github.com/codekoala/go-aws-lanes/releases/download/v${pkgver}/lanes_linux_amd64"
  "https://github.com/codekoala/go-aws-lanes/raw/v${pkgver}/LICENSE"
)
sha256sums=('e8e9659407ab327c1f87ab9ea0de0c0c9e34d0428489d9fa34b966195a5c6ac8'
            'cf03ea3ea781a1e6291c16bebe5424b122dc0a996b4807f9f9c5909838909613')
options=(!strip)

package() {
  install -Dm755 ../lanes_linux_amd64 "${pkgdir}/usr/bin/lanes"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et ai:
