# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=tendermint
_pkgname=tendermint
pkgname=${_pkgname}-bin
pkgver=0.34.23
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
sha256sums_x86_64=('4d176dff499cb514149875484a606393b474651600cc7332b8d371a52c964d1c')
sha256sums_aarch64=('4e98b2bbedf87dd8cfb2475974a6a9ec0404c19e4b2cfdd75aa7cf553275de32')
sha256sums_armv6h=('94963ca16634b1fcc88e97f36911e6e60592bd24a9cc4f4dc7ff0291396964a7')

package() {
    install -Dt "$pkgdir/usr/local/bin" "$_pkgname"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
