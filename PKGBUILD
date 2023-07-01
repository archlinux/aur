pkgname=dnsch
pkgver=1.1
pkgdesc="A simple package that helps you to set your Arch linux system on shecan or google"
url="https://github.com/mohammadrostamiorg/dnsChanger"
arch=('any')
license=('MIT')
maintainer="Mohammad Rosstami <mohammad.jayant@gmail.com>"
source=("dnsch.sh")
depends=('bash' 'coreutils')
pkgrel=1
md5sums=('SKIP')
package() {
  install -Dm755 dnsch.sh "${pkgdir}/usr/bin/dnsch"
}
