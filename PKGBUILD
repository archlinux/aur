# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=taxonkit-bin
_pkgname=taxonkit
pkgver=0.20.0
pkgrel=1
pkgdesc="A practical and efficient NCBI Taxonomy toolkit in Go"
arch=('x86_64')
url="https://github.com/shenwei356/taxonkit"
license=('MIT')
provides=('taxonkit')
conflicts=('taxonkit')
options=('!strip' '!debug')
source=(
  "https://github.com/shenwei356/taxonkit/releases/download/v${pkgver}/taxonkit_linux_amd64.tar.gz"
  "https://raw.githubusercontent.com/shenwei356/taxonkit/v${pkgver}/LICENSE"
)
sha256sums=('d801ea82f9e516a9f0ccecf72a8212809677b8742fb9528d407fbfca8811a553'
            '9ecbcee798e1d29dcf6650d0a2cd3db40023d2c2d5d357b6b375e6f3ae3efd45')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
