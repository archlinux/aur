# Maintainer: Martin Pugh <martin at parity dot io>

_appname=polkadot
pkgname=${_appname}-bin
pkgver=0.9.9
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
  "faf12992aa860e725ba7b9e06bb4d09a440b1ab1befbfc00a7cd4e81a2f76ac5"
  "84e5644fcb60adc9f5ef6d6687f670347413dd265a11f736c58acaace6d878c4"
)

package(){
  install -D -m755 polkadot "${pkgdir}/usr/bin/polkadot"
}
