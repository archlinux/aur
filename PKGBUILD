# Maintainer: Ranadeep B < mail at rnbguy dot at >

_prjname=cosmos
_orgname=strangelove-ventures
_reponame=lens
_pkgname=${_prjname}-${_reponame}
pkgname=${_pkgname}-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Lens for Cosmos ecosystem"
arch=('x86_64' 'aarch64')
url="https://github.com/${_orgname}/${_reponame}"
license=('Apache')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("https://github.com/${_orgname}/${_reponame}/releases/download/v${pkgver}/lens_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/${_orgname}/${_reponame}/releases/download/v${pkgver}/lens_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5deeaa87e6f27a9727d5b6699095f7d5e05f79f000d3de7b771c54aabae1f94b')
sha256sums_aarch64=('e9f54a40e764692ea14477bb5c07852dd50ce41d37ee0ebd897819d9c4dc42b3')

package() {
	install -DT "${_reponame}" "${pkgdir}/usr/local/bin/${_pkgname}"
	install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
