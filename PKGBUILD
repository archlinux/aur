# Maintainer: Martin Pugh <martin at parity dot io>

_appname=polkadot
pkgname=${_appname}-bin
pkgver=0.8.23
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
  "e83f51b0f180492e22bff288a68bc35029f360b0570b003d3a1830a2fc50a5c5"
  "4170988cec8be9db573fee133ccec2a9ae5d871e7f08608e19bc233509abe757"
)

package(){
  install -D -m755 polkadot "${pkgdir}/usr/bin/polkadot"
}
