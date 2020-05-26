# Maintainer: Martin Pugh <martin at parity dot io>

_appname=polkadot
pkgname=${_appname}-bin
pkgver=0.8.0
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
  "775c036ebfa4bc535128148e40d09149599b10cee24e8bc51e72553a4eb2307b"
  "d666668c541a8cf769f8b08ae64c4c364fd16d93d635b450474bd55291b781d4"
)

package(){
  install -D -m755 polkadot "${pkgdir}/usr/bin/polkadot"
}
