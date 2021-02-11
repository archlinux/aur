# Maintainer: Martin Pugh <martin at parity dot io>

_appname=polkadot
pkgname=${_appname}-bin
pkgver=0.8.28
pkgrel=2
pkgdesc="Binary builds of the Polkadot Node Implementation"
arch=('x86_64')
provides=("${_appname}")
conflicts=("${_appname}")
url="https://github.com/paritytech/${_appname}"
license=('GPL3')
validpgpkeys=('9D4B2B6EB8F97156D19669A9FF0812D491B96798')
_urlbase="${url}/releases/download"

source=(
  "${_urlbase}/v${pkgver}-1/polkadot"
  "${_urlbase}/v${pkgver}-1/polkadot.asc"
)

sha256sums=(
  "88b22238cf54c87be1ebe62c1a1a753cd9adc193ee0e5840d5dc2c0092c42cf8"
  "d81f6d07a21e553d0f28aa432d6fa89e0bb86f323b2187f8aeed524b5839edfb"
)

package(){
  install -D -m755 polkadot "${pkgdir}/usr/bin/polkadot"
}
