# Maintainer: proofconstruction <source@proof.construction>

pkgname=('fortran-fpm-bin')
_pkgname='fpm'
pkgver=0.4.0
pkgrel=1
pkgdesc="A package manager and build system for Fortran."
arch=('x86_64')
url="https://fpm.fortran-lang.org/"
license=('MIT')
conflicts=('fpm')
source=("https://github.com/fortran-lang/fpm/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-${arch}")
sha256sums=('50feb77df2ec98c70d5eb244ed66c3708bd123684c1c75b0e35666457df5f5c9')

package() {
	  install -Dm 755 "${srcdir}/${_pkgname}-${pkgver}-linux-${arch}" "${pkgdir}/usr/bin/${_pkgname}"
}
