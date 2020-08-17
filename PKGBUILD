# Maintainer: Martin Pugh <martin at parity dot io>

_appname=polkadot
pkgname=${_appname}-bin
pkgver=0.8.19
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
  "143e09afd06fd8351b43d37fb194ac6f688501e388c1057a777ae7724c15f2c9"
  "9c662ecf662cd6a55353692cb30a7774f38bdac261b719aa45daf0e0c36a1845"
)

package(){
  install -D -m755 polkadot "${pkgdir}/usr/bin/polkadot"
}
