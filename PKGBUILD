# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=universal-sierra-compiler
pkgname=${_pkgname}-bin
_orgname=software-mansion
_github=${_orgname}/${_pkgname}
pkgver=2.4.0
pkgrel=1
pkgdesc='Compiler for any ever-existing Sierra version to CASM'
arch=('x86_64' 'aarch64')
url="https://github.com/${_github}"
license=('LicenseRef-unknown')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=('LICENSE')
source_x86_64=("https://github.com/${_github}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/${_github}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('b64c710c4f9fde0a30ca5daa6fe5542aafbb796a7bdc9c96a994fd1bfccca09e')
sha256sums_x86_64=('0153397036e22f520d39c76479c14227dcffa8812849f9333ab0cfb11bb6b658')
sha256sums_aarch64=('cfc286c5dcb556679b8b625fae080d47d11b3b349db51c7555b3cb922e2ae69e')

package() {
	install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

