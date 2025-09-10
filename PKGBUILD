# Maintainer: haxibami <contact at haxibami dot net>

pkgname=dug-bin
_pkgver=dug-20250812
pkgver=${_pkgver#dug-}
pkgrel=1
pkgdesc='Extensible DNS libraries written purely in Haskell'
arch=('x86_64')
url='https://github.com/kazu-yamamoto/dnsext'
license=('BSD-3-Clause')
provides=('dug')
conflicts=('dug')
source=("${url}/releases/download/${_pkgver}/dug-linux-x86_64")
sha256sums=('c4e89344f611132d6114db40c9c2f1db05bf7ddb8503afffb2a6c88e8763b7be')

package() {
  cd "$srcdir"
  install -Dm755 dug-linux-x86_64 "${pkgdir}/usr/bin/dug"
}
