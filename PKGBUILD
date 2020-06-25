# Maintainer: Martin Pugh <martin at parity dot io>

_appname=polkadot
pkgname=${_appname}-bin
pkgver=0.8.12
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
  "6b438baf4992e813ba6c4336f1084435234a897163936e93615e9cb5a06c2bbf"
  "d43772d5d1c736a12240fd7d16f15481ffcece0899bb1ef5712b23a564aed8e3"
)

package(){
  install -D -m755 polkadot "${pkgdir}/usr/bin/polkadot"
}
