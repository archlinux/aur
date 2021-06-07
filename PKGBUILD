# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="immudb"
pkgver="1.0.1"
pkgrel=1
pkgdesc="immudb - world’s fastest immutable database"
arch=('x86_64')
url="https://www.codenotary.com/technologies/immudb/"
license=('Apache-2.0')
source=("https://github.com/codenotary/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-amd64")
sha256sums=('026723f2f78ddcb978e1621cadf1b907bdd20fa89ce2ed055829add5b1fe3bb3')

package() {
  mkdir -p "${pkgdir}/usr/local/bin"
  install -Dm755 "${pkgname}-v${pkgver}-linux-amd64" "$pkgdir/usr/local/bin/${pkgname}"
}
