# Maintainer: Glucy2<glucy-2@outlook.com>
_pkgname=sast-evento
pkgname=${_pkgname}-bin

pkgver="2.0.46"
_hotfix=0
_pkgrel=0
pkgrel="$((_pkgrel+_hotfix))"
replace=('sast-evento-appimage')

pkgdesc='An event management system developed and used by NJUPT SAST (binary package)'

license=('MIT')

arch=('x86_64')

url="https://github.com/NJUPT-SAST/sast-evento"

provides=(${_pkgname})
conflicts=(${_pkgname})
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.${_hotfix}-pacman-linux-x64.pkg.tar.zst")
sha256sums_x86_64=('814a58b3159d52d826d5a4a65395a29c18de8f5d0641f0d6ee713d6acb22e672')

package() {
    cp -r ${srcdir}/* ${pkgdir}
}
