# Maintainer: Martin Pugh <martin at parity dot io>

_appname=polkadot
pkgname=${_appname}-bin
pkgver=0.8.22
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
  "acae8f45986cf3dc143b42152811b17939891595c16e7bc020466e9e9f1de71e"
  "aebc4823047229b5cc97c655eb10d1df229232c281eb59c2aaaade4fe7707498"
)

package(){
  install -D -m755 polkadot "${pkgdir}/usr/bin/polkadot"
}
