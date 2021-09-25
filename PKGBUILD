# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="immuadmin"
_pkgname="immudb"
pkgver="1.1.0"
pkgrel=1
pkgdesc="immudb - world’s fastest immutable database"
arch=('x86_64')
url="https://www.codenotary.com/technologies/immudb/"
license=('Apache-2.0')
source=("https://github.com/codenotary/${_pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-amd64")
sha256sums=('68023cda445139daf3ace0be4c31453f235b969fc748efc2e9dfda03e1fe592a')

package() {
  mkdir -p "${pkgdir}/usr/local/bin"
  install -Dm755 "${pkgname}-v${pkgver}-linux-amd64" "$pkgdir/usr/local/bin/${pkgname}"
}
