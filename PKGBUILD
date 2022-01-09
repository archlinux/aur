# Maintainer: Ranadeep B < mail at rnbguy dot at >

_prjname=cosmos
_orgname=strangelove-ventures
_reponame=lens
_pkgname=${_prjname}-${_reponame}
pkgname=${_pkgname}-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Lens for Cosmos ecosystem"
arch=('x86_64' 'aarch64')
url="https://github.com/${_orgname}/${_reponame}"
license=('Apache')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("https://github.com/${_orgname}/${_reponame}/releases/download/v${pkgver}/lens_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/${_orgname}/${_reponame}/releases/download/v${pkgver}/lens_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('cfa57ccf860dffc292af2740a4e6d10fe838f3906a0540e9099be8c0b90999ff')
sha256sums_aarch64=('3c17bec6c1acf134f09c45db3d088e6dfa2dab982707d9e0ec6e10950dbda6ae')

package() {
	install -DT "${_reponame}" "${pkgdir}/usr/local/bin/${_pkgname}"
	install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
