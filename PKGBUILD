# Maintainer: Martin Pugh <martin at parity dot io>

_appname=polkadot
pkgname=${_appname}-bin
pkgver=0.8.1
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
  "cf195f8be2ac9471f9a2b62fb4d2b46ff96845569506002fedb2da774277d998"
  "7aabe4a3bab791670208dc8eb84153c5c10a112ea5fdc93fc2a8ca14f439aca6"
)

package(){
  install -D -m755 polkadot "${pkgdir}/usr/bin/polkadot"
}
