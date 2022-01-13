# Maintainer: Ranadeep B < mail at rnbguy dot at >

_prjname=cosmos
_orgname=strangelove-ventures
_reponame=lens
_pkgname=${_prjname}-${_reponame}
pkgname=${_pkgname}-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Lens for Cosmos ecosystem"
arch=('x86_64' 'aarch64')
url="https://github.com/${_orgname}/${_reponame}"
license=('Apache')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("https://github.com/${_orgname}/${_reponame}/releases/download/v${pkgver}/lens_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/${_orgname}/${_reponame}/releases/download/v${pkgver}/lens_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f4de75faa3fb49ca06ad3784b37e9f8c928ca0c79059b4dd842f11cd49e52352')
sha256sums_aarch64=('5e7079f57f8f4f6125fb9f5e5382c6d31c4c8878bf4df3588af1e32a278016e1')

package() {
	install -DT "${_reponame}" "${pkgdir}/usr/local/bin/${_pkgname}"
	install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
