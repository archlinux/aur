# Maintainer: proofconstruction <source@proof.construction>

pkgname=('fortran-fpm-bin')
_pkgname='fpm'
pkgver=0.1.4
revision=79d7fb65a97614bf0bfb27dc2b78c94d5f76b326
pkgrel=1
pkgdesc="A package manager and build system for Fortran."
arch=('x86_64')
url="https://fpm.fortran-lang.org/"
license=('MIT')
conflicts=('fpm')
source=("https://github.com/fortran-lang/fpm/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-${arch}")
sha256sums=('daa23d634ea029645be45278ff1368def50b2bc2f8556912663ee350c02e3638')

package() {
	  install -Dm 755 "${srcdir}/${_pkgname}-${pkgver}-linux-${arch}" "${pkgdir}/usr/bin/${_pkgname}"
}
