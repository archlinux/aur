# Maintainer: Martin Pugh <martin at parity dot io>

_appname=polkadot
pkgname=${_appname}-bin
pkgver=0.8.24
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
  "8d79d4d7b9654f40340516ab160e1f4ea2c7c0c39493ffc01ba83b9e3c8ab2a0"
  "67de1028cedf6c9fe3d1091c4d286bea6f7a0dfac34877f3320761202b702a5e"
)

package(){
  install -D -m755 polkadot "${pkgdir}/usr/bin/polkadot"
}
