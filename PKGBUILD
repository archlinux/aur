#Maintainer: Josh Münte
#Auto generated. Do not edit.
_pkgname='knockson'
pkgname="${_pkgname}-bin"
pkgver=0.8.0
pkgrel=1
pkgdesc='simple multi-threaded port scanner written in rust'
arch=('x86_64')
url='https://github.com/joshmuente/knockson'
_url_source='https://github.com/joshmuente/knockson'
license=('MIT')
depends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_url_source}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_${arch}-unknown-linux-musl.tar.xz")
sha256sums=('85b0d669bba0c453eee1f4b506090eae1706f7fdd56682c8a35c9d688d5f0865')

package () {
  install -Dm 775 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}