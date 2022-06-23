# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=tendermint
_pkgname=tendermint
pkgname=${_pkgname}-bin
pkgver=0.35.7
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
sha256sums_x86_64=('9687d8495f128cdef428407033206804d62283c85200eeddfaab0eb6f7cd85bd')
sha256sums_aarch64=('e74fa6c42aa6cb23eff78977ad6a70539874cdcddd0fd6a29b44a79fabfcf616')
sha256sums_armv6h=('5a4dea57cfb2830a2493d2182cf4efe8ebe127354f6c68dab83c22d4314d4039')

package() {
    install -Dt "$pkgdir/usr/local/bin" "$_pkgname"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
