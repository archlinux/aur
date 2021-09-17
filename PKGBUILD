#Maintainer: Josh Münte
#Auto generated. Do not edit.
_pkgname='nightwaveplaza-tui'
pkgname="${_pkgname}-bin"
pkgver=0.2.16
pkgrel=1
pkgdesc='simple multi-threaded port scanner written in rust'
arch=('x86_64')
url='https://github.com/joshmuente/nightwaveplaza-tui'
_url_source='https://github.com/joshmuente/nightwaveplaza-tui'
license=('MIT')
depends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_url_source}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_${arch}-unknown-linux-gnu.tar.xz")
sha256sums=('3539da6990724a18d5d17d0f9b19c9d0992e0d882406ca8f372881b6e1d3e44a')

package () {
  install -Dm 775 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}