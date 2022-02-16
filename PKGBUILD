# Maintainer: Ranadeep B < mail at rnbguy dot at >

_prjname=cosmos
_orgname=strangelove-ventures
_reponame=lens
_pkgname=${_prjname}-${_reponame}
pkgname=${_pkgname}-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Lens for Cosmos ecosystem"
arch=('x86_64' 'aarch64')
url="https://github.com/${_orgname}/${_reponame}"
license=('Apache')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("https://github.com/${_orgname}/${_reponame}/releases/download/v${pkgver}/lens_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/${_orgname}/${_reponame}/releases/download/v${pkgver}/lens_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('c7ade29648eb27fafc283a09954bdb7398d1391ce18f74a70f0f537d16bc1e1d')
sha256sums_aarch64=('d6034b24e39b4bda0455412b1696d6ce5e833841620181471c5528ce8b3e4499')

package() {
	install -DT "${_reponame}" "${pkgdir}/usr/local/bin/${_pkgname}"
	install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
