# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="immuclient"
_pkgname="immudb"
pkgver="1.0.0"
pkgrel=2
pkgdesc="immudb - world’s fastest immutable database"
arch=('x86_64')
url="https://www.codenotary.com/technologies/immudb/"
license=('Apache-2.0')
source=("https://github.com/codenotary/${_pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-amd64")
sha256sums=('1c7d6e5a8358abf2e53b939c7b7afb00097fd2cde43b36b8f9fcc2f55af508eb')

package() {
  mkdir -p "${pkgdir}/usr/local/bin"
  install -Dm755 "${pkgname}-v${pkgver}-linux-amd64" "$pkgdir/usr/local/bin/${pkgname}"
}
