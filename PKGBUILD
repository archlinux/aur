# Maintainer: eolianoe <eolianoe At GMAIL DoT com>
# Based on the gcc-docs PKGBUILD available in community
_pkgname=libgomp
pkgname=${_pkgname}-docs
pkgver=5.1.0
pkgrel=1
pkgdesc="Documentation of libgomp (GNU implementation of the OpenMP)"
arch=('any')
url="https://gcc.gnu.org/onlinedocs/"
license=('GPL')
options=('docs' '!strip')
source=("https://gcc.gnu.org/onlinedocs/gcc-${pkgver}/${_pkgname}-html.tar.gz")
sha256sums=('427a954cd51e981fb43880ef6c2d7cfb50a0a8bb44f4453617e31f3995edcfec')

package() {
  cd "${srcdir}/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -- *.html "${pkgdir}/usr/share/doc/${_pkgname}"
}
