# Maintainer: Martin Pugh <martin at parity dot io>

_appname=polkadot
pkgname=${_appname}-bin
pkgver=0.8.26
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
  "5a3ffccf1415e0b489f1c8d0b24b4331d4057187a27413d9d6550853cbd8e715"
  "0c7b3e34c6ef1793fe5da93693925795643f4f181c94ec6b4b377c7ba0023368"
)

package(){
  install -D -m755 polkadot "${pkgdir}/usr/bin/polkadot"
}
