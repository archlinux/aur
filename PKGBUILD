# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="immuadmin"
_pkgname="immudb"
pkgver="1.0.5"
pkgrel=2
pkgdesc="immudb - world’s fastest immutable database"
arch=('x86_64')
url="https://www.codenotary.com/technologies/immudb/"
license=('Apache-2.0')
source=("https://github.com/codenotary/${_pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-amd64")
sha256sums=('8b49d6060ea067fac4fe40898c4ecdc1ba0bdf8f38c3bef23b2b8fd53294ff4f')

package() {
  mkdir -p "${pkgdir}/usr/local/bin"
  install -Dm755 "${pkgname}-v${pkgver}-linux-amd64" "$pkgdir/usr/local/bin/${pkgname}"
}
