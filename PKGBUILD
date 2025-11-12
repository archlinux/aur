# Maintainer: gfdsa <aur@gfdsa.org>
pkgname=confluent-cli
pkgver=4.43.0
pkgrel=2
pkgdesc="Command Line Interface for Confluent Platform (Kafka ecosystem tools)"
arch=('x86_64')
url="https://docs.confluent.io/confluent-cli/current/install.html"
license=('Apache')
depends=()
source=("https://packages.confluent.io/confluent-cli/archives/${pkgver}/confluent_linux_amd64.tar.gz")
sha256sums=('81951028df9de12701edb30d31b7d40c64617d2113c018744c2ab0ef000cec51')

package() {
  install -Dm755 "$srcdir/confluent/confluent" "$pkgdir/usr/bin/confluent"
}

