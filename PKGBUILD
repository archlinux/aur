# Maintainer: Martin Pugh <martin at parity dot io>

_appname=polkadot
pkgname=${_appname}-bin
pkgver=0.8.28
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
  "51d719d57243ca16bdbd84bc0cb36d4ee4527fc95e4391ae360657c17cde1c91"
  "d0798770356e92379d388a4c347f69e19bea98ce69e3914a2cdeb0e05039dafe"
)

package(){
  install -D -m755 polkadot "${pkgdir}/usr/bin/polkadot"
}
