# Maintainer: haxibami <contact at haxibami dot net>

pkgname=dug-bin
_pkgver=dug-20250318
pkgver=${_pkgver#dug-}
pkgrel=2
pkgdesc='Extensible DNS libraries written purely in Haskell'
arch=('x86_64')
url='https://github.com/kazu-yamamoto/dnsext'
license=('BSD-3-Clause')
provides=('dug')
conflicts=('dug')
source=("${url}/releases/download/${_pkgver}/dug-linux-x86_64")
sha256sums=('16dca8ed7c4c40d5c0822ec717ca8cea4df20e98a78e2b79db44c8225f56b05f')

package() {
  cd "$srcdir"
  install -Dm755 dug-linux-x86_64 "${pkgdir}/usr/bin/dug"
}
