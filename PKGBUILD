# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Based on the gcc-docs PKGBUILD available in community
_pkgname=gfortran
pkgname=${_pkgname}-docs
pkgver=5.1.0
pkgrel=1
pkgdesc="Set of HTML documentation for then GNU Fortran compiler"
arch=('any')
url="https://gcc.gnu.org/onlinedocs/"
depends=('libgomp-docs')
license=('GPL')
options=('docs' '!strip')
source=("http://gcc.gnu.org/onlinedocs/gcc-${pkgver}/${_pkgname}-html.tar.gz")
sha256sums=('2b5ff84d27524e74bb104d4e1c67300b4dc37a6be0fc1bc9458fa32aa401e44e')

package() {
  cd "${srcdir}/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -- *.html "${pkgdir}/usr/share/doc/${_pkgname}/"
}
