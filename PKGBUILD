# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="immuclient"
_pkgname="immudb"
pkgver="1.1.0"
pkgrel=1
pkgdesc="immudb - world’s fastest immutable database"
arch=('x86_64')
url="https://www.codenotary.com/technologies/immudb/"
license=('Apache-2.0')
source=("https://github.com/codenotary/${_pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-amd64")
sha256sums=('ec3080c80eb1322166e2978e3d41018691c136b05045c45761a19cd33ef41153')

package() {
  mkdir -p "${pkgdir}/usr/local/bin"
  install -Dm755 "${pkgname}-v${pkgver}-linux-amd64" "$pkgdir/usr/local/bin/${pkgname}"
}
