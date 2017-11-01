# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=aws-lanes
pkgver=0.3.0
pkgrel=2
pkgdesc="Utility for interacting with different lanes of servers on AWS."
arch=('x86_64')
url="https://github.com/codekoala/go-aws-lanes"
license=('BSD')
source=(
  "https://github.com/codekoala/go-aws-lanes/releases/download/v${pkgver}/lanes_linux_amd64"
  "https://github.com/codekoala/go-aws-lanes/raw/v${pkgver}/LICENSE"
)
sha256sums=('e5e1cc6c7967776d1c41dfb3fc5997b199cabf8b94f5b25da2008ff4d498f19c'
            'cf03ea3ea781a1e6291c16bebe5424b122dc0a996b4807f9f9c5909838909613')
options=(!strip)

package() {
  install -Dm755 ../lanes_linux_amd64 "${pkgdir}/usr/bin/lanes"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et ai:
