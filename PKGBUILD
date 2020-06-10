# Maintainer: Martin Pugh <martin at parity dot io>

_appname=polkadot
pkgname=${_appname}-bin
pkgver=0.8.7
pkgrel=1
pkgdesc="Binary builds of the Polkadot Node Implementation"
arch=('x86_64')
provides=("${_appname}")
conflicts=("${_appname}")
url="https://github.com/paritytech/${_appname}"
license=('GPL3')
validpgpkeys=('9D4B2B6EB8F97156D19669A9FF0812D491B96798')
_urlbase="${url}/releases/download"

source=(
  "${_urlbase}/v${pkgver}/polkadot"
  "${_urlbase}/v${pkgver}/polkadot.asc"
)

sha256sums=(
  "360e339ab8c32b862bf21aca2bed1e20a90b44ed9cab1428d5e9f0ce1dad9502"
  "522f4a265893bfba21eb59920086af4145464edbdc20bb18c56c351809ee7f68"
)

package(){
  install -D -m755 polkadot "${pkgdir}/usr/bin/polkadot"
}
