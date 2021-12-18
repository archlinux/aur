# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="immuclient"
_pkgname="immudb"
pkgver="1.2.1"
pkgrel=1
pkgdesc="immudb - world’s fastest immutable database"
arch=('x86_64')
url="https://www.codenotary.com/technologies/immudb/"
license=('Apache-2.0')
source=("https://github.com/codenotary/${_pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-amd64")
sha256sums=('2a85728cfe3f168bea059f5ee16884fcd61ae14bb558b7117cd42cd49020f938')

package() {
  mkdir -p "${pkgdir}/usr/local/bin"
  install -Dm755 "${pkgname}-v${pkgver}-linux-amd64" "$pkgdir/usr/local/bin/${pkgname}"
}
