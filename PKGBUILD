# Maintainer: Martin Pugh <martin at parity dot io>

_appname=polkadot
pkgname=${_appname}-bin
pkgver=0.8.3
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
  "8d1013a018fbaf8b20b3d87b58ed27d69fb231c5195c2a63d95eccd9fc3c74eb"
  "df69d62adbfe8843acb1890b90313a75aaf668c9c0f435bbebd15378bc5c4d65"
)

package(){
  install -D -m755 polkadot "${pkgdir}/usr/bin/polkadot"
}
