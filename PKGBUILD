# Maintainer: Glucy2<glucy-2@outlook.com>
_pkgname=sast-evento
pkgname=${_pkgname}-bin

pkgver="2.0.55"
_hotfix=0
_pkgrel=1
pkgrel="$((_pkgrel+_hotfix))"
replace=('sast-evento-appimage')
provides=("${_pkgname}")
conflicts=("${_pkgname}-git" "${_pkgname}")

pkgdesc='An event management system developed and used by NJUPT SAST (binary package)'

license=('MIT')

arch=('x86_64')

url="https://github.com/NJUPT-SAST/sast-evento"

source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.${_hotfix}-pacman-linux-x64.pkg.tar.zst")
sha256sums_x86_64=('ea079c4d1e0952d8e20226ee1c3ad650b4a991cb23388a3dee7d9b7f128ae0b1')

package() {
    cp -r "${srcdir}"/* "${pkgdir}"
    rm -rf "${pkgdir}"/*.pkg.*
}
