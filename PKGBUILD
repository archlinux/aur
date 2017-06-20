# Maintainer: eolianoe <eolianoe At GMAIL DoT com>
# Based on the gcc-docs PKGBUILD available in community
_pkgname=libgomp
pkgname=${_pkgname}-docs
pkgver=7.1.0
pkgrel=1
pkgdesc="Documentation of libgomp (GNU implementation of the OpenMP)"
arch=('any')
url="https://gcc.gnu.org/onlinedocs/"
license=('GPL')
options=('docs' '!strip')
source=(${pkgname}-html-${pkgver}.tar.gz::"https://gcc.gnu.org/onlinedocs/gcc-${pkgver}/${_pkgname}-html.tar.gz")
sha256sums=('6142acbe4d14b38018f5146378b55aa0897ec4895c86c8402d581404af92d9cd')

package() {
  cd "${srcdir}/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -- *.html "${pkgdir}/usr/share/doc/${_pkgname}"
}
