# Maintainer: Ranadeep B < mail at rnbguy dot at >

_prjname=cosmos
_orgname=strangelove-ventures
_reponame=lens
_pkgname=${_prjname}-${_reponame}
pkgname=${_pkgname}-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Lens for Cosmos ecosystem"
arch=('x86_64' 'aarch64')
url="https://github.com/${_orgname}/${_reponame}"
license=('Apache')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("https://github.com/${_orgname}/${_reponame}/releases/download/v${pkgver}/lens_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/${_orgname}/${_reponame}/releases/download/v${pkgver}/lens_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('146206c63d88f642d72e90b3e60caeccb1f8ec4da6c58831a5676ae5f6aebe06')
sha256sums_aarch64=('5bc1c621d65d4082b6fb0afe67fd2360e7c25ea125c937cf4a247231d2abc061')

package() {
	install -DT "${_reponame}" "${pkgdir}/usr/local/bin/${_pkgname}"
	install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
