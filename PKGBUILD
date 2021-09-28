# Maintainer: Martin Pugh <martin at parity dot io>

_appname=polkadot
pkgname=${_appname}-bin
pkgver=0.9.10
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
  "0d576f4f216e46e9915fe0d829460e551c9d78fc85bedf2db9a3c09d41ecd0fa"
  "d77ee806763b9f074d35d80bff90f612eee1d5223263c55e3fc75f2b61cd6142"
)

package(){
  install -D -m755 polkadot "${pkgdir}/usr/bin/polkadot"
}
