# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=tendermint
_pkgname=tendermint
pkgname=${_pkgname}-bin
pkgver=0.35.4
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
sha256sums_x86_64=('fb4e402a21989920e0cb8b174cbfe0dae73179f347f620f008adcfb67a61ccbf')
sha256sums_aarch64=('5a2d34d38de56213e189b22486a9784ab0045f736be4c213808d0c196525b959')
sha256sums_armv6h=('a9e95f475a3e9f8121a78090a9444aa3d8c11fdaf943fe0500f1d75540ca482f')

package() {
    install -Dt "$pkgdir/usr/local/bin" "$_pkgname"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
