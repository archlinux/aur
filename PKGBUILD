# Maintainer: Greg Smith <gasmith at gmail dot com>
# Contributor: Emil Edholm <bobby @ verypublic.org>

pkgname=mcap-cli-bin
pkgver=0.3.0
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
sha256sums=('5d4100573fab880f1c6400952466275bb3b32c3d230a54f7c380ee0d08e59eef')

#prepare() {
#}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/bin"
  install -D -m755 "$pkgname-$pkgver-${arch}" "$pkgdir"/usr/bin/mcap
}
