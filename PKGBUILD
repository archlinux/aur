# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=universal-sierra-compiler
pkgname=${_pkgname}-bin
_orgname=software-mansion
_github=${_orgname}/${_pkgname}
pkgver=2.5.0
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
sha256sums_x86_64=('96d2f58d5f23f0a4160d33c2dd48b29353babeec2edd0f3215f9ad683ea74d56')
sha256sums_aarch64=('8583bb7ff47b0a2f3cf4d46c1b54c1a5c6d66aec02bf537be3a750e075580809')

package() {
	install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

