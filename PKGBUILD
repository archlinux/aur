# Maintainer: Glucy2<glucy-2@outlook.com>
_pkgname=sast-evento
pkgname=${_pkgname}-bin

pkgver="2.0.53"
_hotfix=0
_pkgrel=0
pkgrel="$((_pkgrel+_hotfix))"
replace=('sast-evento-appimage')
provides=("${_pkgname}")
conflicts=("${_pkgname}-git" "${_pkgname}")

pkgdesc='An event management system developed and used by NJUPT SAST (binary package)'

license=('MIT')

arch=('x86_64')

url="https://github.com/NJUPT-SAST/sast-evento"

source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.${_hotfix}-pacman-linux-x64.pkg.tar.zst")
sha256sums_x86_64=('0798e231166d66a652f7e5404454be2a31c6e0f260ffc83c4ee70af2f791ba7a')

package() {
    cp -r "${srcdir}"/* "${pkgdir}"
}
