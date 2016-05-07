# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Based on the gcc-docs PKGBUILD available in community
_pkgname=gfortran
pkgname=${_pkgname}-docs
pkgver=6.1.0
pkgrel=1
pkgdesc="Set of HTML documentation for then GNU Fortran compiler"
arch=('any')
url="https://gcc.gnu.org/onlinedocs/"
depends=('libgomp-docs')
license=('GPL')
options=('docs' '!strip')
source=(${pkgname}-html-${pkgver}.tar.gz::"https://gcc.gnu.org/onlinedocs/gcc-${pkgver}/${_pkgname}-html.tar.gz")
sha256sums=('4045cdecfd42b405c0e636c45cbf0585565ed20419bac8d819fe6ea7b061101b')

package() {
  cd "${srcdir}/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -- *.html "${pkgdir}/usr/share/doc/${_pkgname}/"
}
