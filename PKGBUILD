# Maintainer: dreieck

_pkgname=chrootuid-doc
pkgname="${_pkgname}"
pkgver=1.3
pkgrel=1
arch=('any')
pkgdesc="Documentation for 'chrootuid'."
url="http://ftp.porcupine.org/pub/security/index.html"
license=("BSD")
makedepends=()
depends=()
optdepends=('chrootuid: For the actual software this documentation is for (including manpage).')
source=(
  "README::ftp://ftp.porcupine.org/pub/security/chrootuid1.3.README"
  "chrootuid_license::ftp://ftp.porcupine.org/pub/security/chrootuid_license"
)
sha256sums=(
  '32a26521f7ee3d2ac8a79534c8aee4e33d23dbc03033437f260ca3a03aafedde'
  '45432b6a45d993c0d05fedd7aba81ece972d4e2e82e23621cda5d234644af83d'
)

package() {
  install -D -v -m644 "${srcdir}/README" "${pkgdir}/usr/share/doc/${_pkgname}/README.txt"
  install -D -v -m644 "${srcdir}/chrootuid_license" "${pkgdir}/usr/share/licenses/${pkgname}/license"
}
