#Maintainer: Josh Münte
#Auto generated. Do not edit.
_pkgname='knockson'
pkgname="${_pkgname}-bin"
pkgver=0.9.1
pkgrel=1
pkgdesc='simple multi-threaded port scanner written in rust'
arch=('x86_64')
url='https://github.com/jjoshm/knockson'
_url_source='https://github.com/jjoshm/knockson'
license=('MIT')
depends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_url_source}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_${arch}-unknown-linux-musl.tar.xz")
sha256sums=('f732167159f96079bfb89d4b3d34e3e993a13661d11870824ac03a0a75897fad')

package () {
  install -Dm 775 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}