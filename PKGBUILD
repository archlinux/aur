# Maintainer: haxibami <contact at haxibami dot net>

pkgname=dug-bin
_pkgver=dug-20240829
pkgver=${_pkgver#dug-}
pkgrel=1
pkgdesc='Extensible DNS libraries written purely in Haskell'
arch=('x86_64')
url='https://github.com/kazu-yamamoto/dnsext'
license=('BSD-3-Clause')
provides=('dug')
conflicts=('dug')
source=("${url}/releases/download/${_pkgver}/dug-linux-x86_64")
sha256sums=('b53c855a6c95bebb0e4cc7d41f36ba6117d21374ab6f35b611ddbbd6afe24991')

package() {
  cd "$srcdir"
  install -Dm755 dug-linux-x86_64 "${pkgdir}/usr/bin/dug"
}
