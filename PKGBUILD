# Maintainer: eolianoe <eolianoe At GMAIL DoT com>
# Based on the gcc-docs PKGBUILD available in community
_pkgname=libgomp
pkgname=${_pkgname}-docs
pkgver=5.3.0
pkgrel=1
pkgdesc="Documentation of libgomp (GNU implementation of the OpenMP)"
arch=('any')
url="https://gcc.gnu.org/onlinedocs/"
license=('GPL')
options=('docs' '!strip')
source=(${pkgname}-html-${pkgver}.tar.gz::"https://gcc.gnu.org/onlinedocs/gcc-${pkgver}/${_pkgname}-html.tar.gz")
sha256sums=('d00ec2a6b042192c5b1c2485da50e368ea4ca3dbefc2127e44947487bd5e1015')

package() {
  cd "${srcdir}/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -- *.html "${pkgdir}/usr/share/doc/${_pkgname}"
}
