pkgname=rmatrix-bin
_pkgname=rmatrix
pkgver=2.0.3
pkgrel=1
pkgdesc='Rust port of cmatrix'
arch=('x86_64' 'aarch64')
url='https://github.com/Fierthraix/rmatrix'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('8f91ca287652d2c3c98ad5f6b20aae28be7bae5bfd64bb23ff1eaee4b279444e')
sha256sums_aarch64=('677c71868dfbf0bb7df96385a9477ecc27102dcc4cc91a9adcdeb96df0ba9a5b')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu/r-matrix" "${pkgdir}/usr/bin/${_pkgname}"
}
