# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=starknet-devnet
pkgname=${_pkgname}-bin
_orgname=0xSpaceShard
_github=${_orgname}/${_pkgname}
pkgver=0.9.1
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
sha256sums_x86_64=('795b278badd8f7b6bf092dda5130e9aa76dfec9ec11e9361c2b3dd02213b2916')
sha256sums_aarch64=('4f211061678d896394cca1e761e6830fc1fdb4dfef91d6109e5d85abffc9b72c')

package() {
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
