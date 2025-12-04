# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=starknet-devnet
pkgname=${_pkgname}-bin
_orgname=0xSpaceShard
_github=${_orgname}/${_pkgname}
pkgver=0.7.0
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
sha256sums_x86_64=('768ca83f10d55f4ae9d8dcdee576ff99e8bfbfcd278c0ce201eeed1850d20bb7')
sha256sums_aarch64=('32435c84cffe28d5d7e9b5864d8867fdc0a87f1a9a8b2d79be4b261f5f650961')

package() {
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
