# Maintainer: Emil Edholm <bobby @ verypublic.org>

pkgname=mcap-cli-bin
pkgver=0.0.53
pkgrel=1
pkgdesc='MCAP is a modular container format and logging library for pub/sub messages with arbitrary message serialization.'
arch=('x86_64')
license=('MIT')
url='https://github.com/foxglove/mcap'
depends=()
optdepends=()
conflicts=('mcap-cli')
provides=('mcap-cli')

source=("${pkgname}-${pkgver}-${arch}::https://github.com/foxglove/mcap/releases/download/releases%2Fmcap-cli%2Fv${pkgver}/mcap-linux-amd64")
sha256sums=('0698e4f4d28a05d887acf9c19dd0518a921d0ec5c18b9b66108998306517c24d')

#prepare() {
#}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/bin"
  install -D -m755 "$pkgname-$pkgver-${arch}" "$pkgdir"/usr/bin/mcap
}
