# Maintainer: haxibami <contact at haxibami dot net>

pkgname=dug-bin
_pkgver=dug-20250318
pkgver=${_pkgver#dug-}
pkgrel=1
pkgdesc='Extensible DNS libraries written purely in Haskell'
arch=('x86_64')
url='https://github.com/kazu-yamamoto/dnsext'
license=('BSD-3-Clause')
provides=('dug')
conflicts=('dug')
source=("${url}/releases/download/${_pkgver}/dug-linux-x86_64")
sha256sums=('473642cb517d7e0c1b4c407b36c5de1d7c48d8d478020ba3acffb44f59820c0b')

package() {
  cd "$srcdir"
  install -Dm755 dug-linux-x86_64 "${pkgdir}/usr/bin/dug"
}
