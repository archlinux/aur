# Maintainer: taotieren <admin@taotieren.com>

pkgname=qt5-base-util
_pkgname=qt5-base
_qtver=5.15.2
pkgver=${_qtver/-/}
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='A cross-platform application and UI framework'
depends=('qt5-base')
makedepends=()
optdepends=()
groups=('qt' 'qt5')
_pkgfn="${_pkgname/5-/}-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/$_qtver/submodules/$_pkgfn.tar.xz")
sha256sums=('909fad2591ee367993a75d7e2ea50ad4db332f05e1c38dd7a5a274e156a4e0f8')

package() 
{
    install -dm755 "${pkgdir}/opt/qt/qt5/${_pkgname}/"
    cp -r "${srcdir}/${_pkgfn}/util" "${pkgdir}/opt/qt/qt5/${_pkgname}/"
}
