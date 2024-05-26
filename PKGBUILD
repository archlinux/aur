pkgname=dnsch
pkgver=1.9
pkgdesc="A simple package that helps you to set your linux system DNS servers to several DNS servers"
url="https://github.com/mohammadrostamiorg/dnsChanger"
arch=('any')
license=('GPL3')
maintainer="Mohammad Rosstami <mohammad.jayant@gmail.com>"
source=("dnsch.sh" "dnsch.1.gz")
depends=('bash' 'coreutils' 'bc')
pkgrel=1
sha256sums=("SKIP" "SKIP")
package() {
  install -Dm755 dnsch.sh "${pkgdir}/usr/bin/dnsch"
  install -Dm644 dnsch.1.gz "${pkgdir}/usr/share/man/man1/dnsch.1.gz"
}
