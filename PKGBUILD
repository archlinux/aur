# Maintainer: Martin Pugh <martin at parity dot io>

_appname=polkadot
pkgname=${_appname}-bin
pkgver=0.7.33
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
  "bfb4c0124e26776b850b7f71eebb86500187f08b49b4da63ed411291bb7da03e"
  "26cc33c7832c4320527a66c3d5b85acc9a40a7d4321f124c20e8a81d2a1612f9"
)

package(){
  install -D -m755 polkadot "${pkgdir}/usr/bin/polkadot"
}
