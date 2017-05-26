# Maintainer: Donald Carr <d@chaos-reins.com>

pkgname=clazy-mkspec
pkgver=0.1
pkgrel=1
pkgdesc='mkspec for use with clazy'
arch=(any)
url='http://www.kdab.com/use-static-analysis-improve-performance/'
license=(GPL2)
depends=(clazy)

package() {
  local _bindir=${pkgdir}/usr/bin
  local _mkspec_dir=${pkgdir}/usr/lib/qt/mkspecs/linux-clazy
  mkdir -p ${_bindir}
  mkdir -p ${_mkspec_dir}
  cd ${startdir}
  cp qmake-clazy ${_bindir}
  cp qmake.conf  qplatformdefs.h ${_mkspec_dir}
}
