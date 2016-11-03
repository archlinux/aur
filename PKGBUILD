# Maintainer: eolianoe <eolianoe At GMAIL DoT com>
# Based on the gcc-docs PKGBUILD available in community
_pkgname=libgomp
pkgname=${_pkgname}-docs
pkgver=6.2.0
pkgrel=1
pkgdesc="Documentation of libgomp (GNU implementation of the OpenMP)"
arch=('any')
url="https://gcc.gnu.org/onlinedocs/"
license=('GPL')
options=('docs' '!strip')
source=(${pkgname}-html-${pkgver}.tar.gz::"https://gcc.gnu.org/onlinedocs/gcc-${pkgver}/${_pkgname}-html.tar.gz")
sha256sums=('5dcef56130d225999cfdc8b1d17f39a4fa480514307e51d84477eda452a8e5c1')

package() {
  cd "${srcdir}/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -- *.html "${pkgdir}/usr/share/doc/${_pkgname}"
}
