pkgname=dnsch
pkgver=1.2
pkgdesc="A simple package that helps you to set your Arch linux system on shecan or google"
url="https://github.com/mohammadrostamiorg/dnsChanger"
arch=('any')
license=('MIT')
maintainer="Mohammad Rosstami <mohammad.jayant@gmail.com>"
source=("dnsch.sh" "dnsch.1.gz")
depends=('bash' 'coreutils')
pkgrel=1
sha256sums=("SKIP" "SKIP")
package() {
  install -Dm755 dnsch.sh "${pkgdir}/usr/bin/dnsch"
  install -Dm644 dnsch.1.gz "${pkgdir}/usr/share/man/man1/dnsch.1.gz"
}
