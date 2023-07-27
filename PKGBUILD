# Maintainer: Ivan 'ivabus' Bushchik ivabus@ivabus.dev -> https://github.com/ivabus

pkgname=plainbase
_pkgname=plainBase
pkgver=0.6.2
pkgrel=1
pkgdesc="plainDE base files"
arch=(any)
url="https://plainde.github.io"
license=(GPL3)
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plainDE/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('24eff817609f7ed6594cbe197a81a2766c868abb18d8bdca197d76da1f4e5010')
conflicts=('plainbase-git')

package() {
  cd "${_pkgname}-${pkgver}"
  
  mkdir -p $pkgdir/usr
  cp -r usr/* $pkgdir/usr/
  chmod 755 $pkgdir/usr/share/plainDE/tools/*
}
