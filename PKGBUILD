# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=starknet-devnet
pkgname=${_pkgname}-bin
_orgname=0xSpaceShard
_github=${_orgname}/${_pkgname}-rs
pkgver=0.1.2
pkgrel=1
pkgdesc='A local testnet for Starknet... in Rust'
arch=('x86_64' 'aarch64')
url='https://docs.swmansion.com/scarb'
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("https://github.com/${_github}/raw/v${pkgver}/LICENSE")
source_x86_64=("https://github.com/${_github}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/${_github}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('c0a1b8b2d4660a9d0254cd420b6034c19ad817dd65199d574880e67127fcbb19')
sha256sums_x86_64=('bce8896d407bc163baab4769b7d0f5740cd63639db487d23bdefdf8f7c5a84f5')
sha256sums_aarch64=('2197c90668f66b1e01ef8cd9655482dac95fa02cfb36838d9db9ccfee3ba0a80')

package() {
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
