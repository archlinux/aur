# Maintainer: proofconstruction <source@proof.construction>

pkgname=('fortran-fpm-bin')
_pkgname='fpm'
pkgver=0.2.0
revision=799fcacee02e60a1679116765c4c3669d31e7201
pkgrel=1
pkgdesc="A package manager and build system for Fortran."
arch=('x86_64')
url="https://fpm.fortran-lang.org/"
license=('MIT')
conflicts=('fpm')
source=("https://github.com/fortran-lang/fpm/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-${arch}")
sha256sums=('c4282998c83bb91a7949d23723a06dc4769a75f8d2c3dcc761794a1b65e8004f')

package() {
	  install -Dm 755 "${srcdir}/${_pkgname}-${pkgver}-linux-${arch}" "${pkgdir}/usr/bin/${_pkgname}"
}
