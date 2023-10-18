# Maintainer: Mark "maemolol" Korobkin <markkorobkin85@gmail.com>

pkgname=plainbase
_pkgname=plainBase
pkgver=0.6.3
pkgrel=1
pkgdesc="plainDE base files"
arch=(any)
url="https://plainde.github.io"
license=(GPL3)
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plainDE/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b187ee8893bcd727728c41c7dd9a4fc83c80649a2a06effbfdc5e401df335449')
conflicts=('plainbase-git')

package() {
  cd "${_pkgname}-${pkgver}"
  
  mkdir -p $pkgdir/usr
  cp -r usr/* $pkgdir/usr/
  chmod 755 $pkgdir/usr/share/plainDE/tools/*
}
