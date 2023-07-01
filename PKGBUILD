pkgname=dnsch
pkgver=1.0
pkgdesc="A simple package that helps you to set your Arch linux system on shecan or google"
url="https://github.com/mohammadrostamiorg/dnsChanger"
arch=('any')
license=('MIT')
maintainer="Mohammad Rosstami <mohammad.jayant@gmail.com>"
source=("dnsch.sh")
depends=('bash' 'coreutils')
pkgrel=1
sha256sums=('3448ffdbff984ed51c6c8f64179b7884691e5c09f3038e816edd166067841b65')
package() {
  install -Dm755 dnsch.sh "${pkgdir}/usr/bin/dnsch"
}
