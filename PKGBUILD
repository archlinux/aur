# Maintainer: taotieren <admin@taotieren.com>

pkgname=qt6-base-util
_pkgname=qt6-base
_qtver=6.0.3
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework'
depends=('qt6-base')
makedepends=()
optdepends=()
groups=(qt6)
_pkgfn="${_pkgname/6-/}-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz")
sha256sums=('1a45b61c2a349964625c50e3ea40cbb309e269762dd0786397e0e18e7e10d394')

package() 
{
    install -dm755 "${pkgdir}/opt/qt/qt6/qt6-base/"
    cp -r "${srcdir}/${_pkgfn}/util" "${pkgdir}/opt/qt/qt6/qt6-base/"
}
