# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=noirup
pkgname=${_pkgname}-bin
_orgname=noir-lang
_github=${_orgname}/${_pkgname}
pkgver=0.1.4
pkgrel=1
pkgdesc='Installation tooling for Noir'
arch=('x86_64')
url='https://https://github.com/${_github}'
license=('LicenseRef-unknown')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=('LICENSE')
source_x86_64=("https://github.com/${_github}/releases/download/v${pkgver}/${_pkgname}")
sha256sums=('b64c710c4f9fde0a30ca5daa6fe5542aafbb796a7bdc9c96a994fd1bfccca09e')
sha256sums_x86_64=('55bec70b71d774f3a36801a3292e19182d107e63093b9ef33b87841197c688a5')

# Add the following lines in ~/.profile:
#   export NARGO_HOME="${HOME}/.nargo"
#   export PATH="${PATH}:${NARGO_HOME}/bin"

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
