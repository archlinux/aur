pkgname=rmatrix-bin
_pkgname=rmatrix
pkgver=2.0.6
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
sha256sums_x86_64=('d3f00a0b4c95d58a832b5e746823f451fff5fac12a9afb2ed2a25ff7fd9dd7c1')
sha256sums_aarch64=('b2696c15db6c621d6185aa3b58e050fd6669a9ba2b7ea827124116f0b058d6ac')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu/r-matrix" "${pkgdir}/usr/bin/${_pkgname}"
}
