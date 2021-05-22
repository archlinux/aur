# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="immudb"
pkgver="1.0.0"
pkgrel=2
pkgdesc="immudb - world’s fastest immutable database"
arch=('x86_64')
url="https://www.codenotary.com/technologies/immudb/"
license=('Apache-2.0')
source=("https://github.com/codenotary/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-amd64")
sha256sums=('2e37ba099e3fe634d689d31636481293095d50cd0becbc0e99e7584415b3c194')

package() {
  mkdir -p "${pkgdir}/usr/local/bin"
  install -Dm755 "${pkgname}-v${pkgver}-linux-amd64" "$pkgdir/usr/local/bin/${pkgname}"
}
