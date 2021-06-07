# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="immuclient"
_pkgname="immudb"
pkgver="1.0.1"
pkgrel=1
pkgdesc="immudb - world’s fastest immutable database"
arch=('x86_64')
url="https://www.codenotary.com/technologies/immudb/"
license=('Apache-2.0')
source=("https://github.com/codenotary/${_pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-amd64")
sha256sums=('d639e29cdf8435e45eb87d6aed89e87f4a6916b6897a6c0de6be9e4a26bd524f')

package() {
  mkdir -p "${pkgdir}/usr/local/bin"
  install -Dm755 "${pkgname}-v${pkgver}-linux-amd64" "$pkgdir/usr/local/bin/${pkgname}"
}
