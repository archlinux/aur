# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=tendermint
_pkgname=tendermint
pkgname=${_pkgname}-bin
pkgver=0.34.19
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
sha256sums_x86_64=('682d80cce0f995be572566354255a692543f65467b69f454c45a52841bb35ea9')
sha256sums_aarch64=('54f1c806e5c8ffafd659d7ddf13ae791d11880ad49465ee224db24b67a622547')
sha256sums_armv6h=('e894062ab578d13e65140757f955e7859aa0de0cd7073e781d8c79f3cb121eaa')

package() {
    install -Dt "$pkgdir/usr/local/bin" "$_pkgname"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
