# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=starknet-devnet
pkgname=${_pkgname}-bin
_orgname=0xSpaceShard
_github=${_orgname}/${_pkgname}
pkgver=0.9.2
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
sha256sums_x86_64=('bef54224c6161673a5c1f3d9674d791878c20e46549b6e3d8917f7a233353784')
sha256sums_aarch64=('b476319fc851a65d7018e2f819861ab0a8bdf36e12e054d742b91cd0e6eef291')

package() {
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
