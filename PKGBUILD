# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=tendermint
_pkgname=tendermint
pkgname=${_pkgname}-bin
pkgver=0.35.3
pkgrel=1
pkgdesc="⟁ Tendermint Core (BFT Consensus) in Go"
arch=('x86_64' 'aarch64' 'armv6h')
url="https://${_pkgname}.com"
license=('Apache')
provides=(${_pkgname})
conflicts=(${_pkgname})
source_x86_64=("https://github.com/${_orgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/${_orgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("https://github.com/${_orgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
sha256sums_x86_64=('04da73fb51774a33dc8cd53ddf9a3fe12e616020fcf842b4cdc3102ff3a6f013')
sha256sums_aarch64=('f584b1b6d6e17b78b35de1c68b37949d23a58a3634fb0157130b04fa235e81d2')
sha256sums_armv6h=('fa9ec7aab4f22cf506de2faa1ea41260d8a537330ad8ef62174d88ed1805b996')

package() {
    install -Dt "$pkgdir/usr/local/bin" "$_pkgname"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
