# Maintainer: Greg Smith <gasmith at gmail dot com>
# Contributor: Emil Edholm <bobby @ verypublic.org>

pkgname=mcap-cli-bin
pkgver=0.4.0
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
sha256sums=('3ace13bc8f0273c69742f25695f7f2df84aed57ddd7c36d5f9a59561dc719fb1')

#prepare() {
#}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/bin"
  install -D -m755 "$pkgname-$pkgver-${arch}" "$pkgdir"/usr/bin/mcap
}
