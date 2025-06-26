# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=starknet-devnet
pkgname=${_pkgname}-bin
_orgname=0xSpaceShard
_github=${_orgname}/${_pkgname}
pkgver=0.4.3
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
sha256sums_x86_64=('87973f17dba6751a766fd7ab3e910a6d3e3bd531a1fea7eb8bfd1cd74ad4c023')
sha256sums_aarch64=('3ecc84333195454774d6dd957397bb8e7598f4e10ca61842d7b8c0b59513b210')

package() {
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
