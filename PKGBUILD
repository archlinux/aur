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
sha256sums_x86_64=('e3b5ee3649300fec9ca38838cf974c446711cf979264711af6a73b4c0eb7a45d')
sha256sums_aarch64=('333cbf394a1dbf9ebfddf32af24d254560b29b3fe391eafbf084516a7dd4f682')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu/r-matrix" "${pkgdir}/usr/bin/${_pkgname}"
}
