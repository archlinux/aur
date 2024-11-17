# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=photoprism
_pkgsuff=facenet
pkgname="${_pkgname}-${_pkgsuff}"
pkgver="20210716.180236"
pkgrel=1
pkgdesc="PhotoPrism's ${_pkgsuff} pre-training model"
arch=("any")
url="https://github.com/${_pkgname}/${_pkgname}"
license=('AGPL-3.0-or-later')
source=("https://dl.photoprism.app/tensorflow/${_pkgsuff}.zip")
sha256sums=('bf9ae0945d2ac53ac3db27082162d2b9dda5ba2c564c0e4c4f539f31f8b670af')

package() {
    find "${_pkgsuff}" -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${_pkgname}/"{} \;
}
