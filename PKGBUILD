# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=photoprism
_pkgsuff=nasnet
pkgname="${_pkgname}-${_pkgsuff}"
pkgver="20200722.072055"
pkgrel=1
pkgdesc="PhotoPrism's ${_pkgsuff} pre-training model"
arch=("any")
url="https://github.com/${_pkgname}/${_pkgname}"
license=('AGPL-3.0-or-later')
source=("https://dl.photoprism.app/tensorflow/${_pkgsuff}.zip")
sha256sums=('a0e1ad8d5a5a0ff9efc4b3ed89898bf008563ee36cacd0c804a384f8fc661588')

package() {
    find "${_pkgsuff}" -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${_pkgname}/"{} \;
}
