# Maintainer: Martin Pugh <martin at parity dot io>

_appname=polkadot
pkgname=${_appname}-bin
pkgver=0.8.26.1
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
  "${_urlbase}/v0.8.26-1/polkadot"
  "${_urlbase}/v0.8.26-1/polkadot.asc"
)

sha256sums=(
  "edd811ccd884e5997493b346d1e8f660414193e0fd55e8fdfc59c8f967644ce6"
  "ed7406069bfeaf27d0232d8d9756ea2f05adb9b2e68ee99f854207493d4ced60"
)

package(){
  install -D -m755 polkadot "${pkgdir}/usr/bin/polkadot"
}
