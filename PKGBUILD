# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=photoprism
_pkgsuff=nsfw
pkgname="${_pkgname}-${_pkgsuff}"
pkgver="20200722.072056"
pkgrel=1
pkgdesc="PhotoPrism's ${_pkgsuff} pre-training model"
arch=("any")
url="https://github.com/${_pkgname}/${_pkgname}"
license=('AGPL-3.0-or-later')
source=("https://dl.photoprism.app/tensorflow/${_pkgsuff}.zip")
sha256sums=('eb5e5d22e37961c3192a4757efff883f77bc989c0efceabb1395e0959d966f14')

package() {
    find "${_pkgsuff}" -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${_pkgname}/"{} \;
}
