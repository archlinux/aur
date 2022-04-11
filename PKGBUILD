# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=aws-lanes
pkgver=0.4.2
pkgrel=1
pkgdesc="Utility for interacting with different lanes of servers on AWS."
arch=('x86_64')
url="https://github.com/codekoala/go-aws-lanes"
license=('BSD')
source=(
  "https://github.com/codekoala/go-aws-lanes/releases/download/v${pkgver}/lanes_linux_amd64"
  "https://github.com/codekoala/go-aws-lanes/raw/v${pkgver}/LICENSE"
)
sha256sums=('dbd8c031fb1d6bb448b541adfbc371f20198b20bb4450b9f59522ec208b18240'
            'cf03ea3ea781a1e6291c16bebe5424b122dc0a996b4807f9f9c5909838909613')
options=(!strip)

package() {
  install -Dm755 ../lanes_linux_amd64 "${pkgdir}/usr/bin/lanes"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et ai:
