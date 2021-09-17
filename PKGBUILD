#Maintainer: Josh Münte
#Auto generated. Do not edit.
_pkgname='nightwaveplaza-tui'
pkgname="${_pkgname}-bin"
pkgver=0.2.17
pkgrel=1
pkgdesc='Nightwave Plaza CLI'
arch=('x86_64')
url='https://github.com/joshmuente/nightwaveplaza-tui'
_url_source='https://github.com/joshmuente/nightwaveplaza-tui'
license=('MIT')
depends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_url_source}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_${arch}-unknown-linux-gnu.tar.xz")
sha256sums=('08adf4cb46c6121867751f297878f61e18666693bc993d0b31d539cdf6170671')

package () {
  install -Dm 775 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}