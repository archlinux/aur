# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="immuclient"
_pkgname="immudb"
pkgver="1.0.5"
pkgrel=1
pkgdesc="immudb - world’s fastest immutable database"
arch=('x86_64')
url="https://www.codenotary.com/technologies/immudb/"
license=('Apache-2.0')
source=("https://github.com/codenotary/${_pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-amd64")
sha256sums=('3e02c58259f093ee6adf4687d7d462a6012b08f7488446675bd49df4da53cfa1')

package() {
  mkdir -p "${pkgdir}/usr/local/bin"
  install -Dm755 "${pkgname}-v${pkgver}-linux-amd64" "$pkgdir/usr/local/bin/${pkgname}"
}
