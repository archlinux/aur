# Maintainer: eolianoe <eolianoe At GMAIL DoT com>
# Based on the gcc-docs PKGBUILD available in community
_pkgname=libgomp
pkgname=${_pkgname}-docs
pkgver=6.1.0
pkgrel=1
pkgdesc="Documentation of libgomp (GNU implementation of the OpenMP)"
arch=('any')
url="https://gcc.gnu.org/onlinedocs/"
license=('GPL')
options=('docs' '!strip')
source=(${pkgname}-html-${pkgver}.tar.gz::"https://gcc.gnu.org/onlinedocs/gcc-${pkgver}/${_pkgname}-html.tar.gz")
sha256sums=('9efb5135cdb4f46ca4e647553bd6dbd9ddc38b4e727bdbfd5a7e1324ad53f0d0')

package() {
  cd "${srcdir}/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -- *.html "${pkgdir}/usr/share/doc/${_pkgname}"
}
