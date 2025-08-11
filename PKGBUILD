# Maintainer: Nirvam <marvinbeeblebrox at gmail dot com>

_pkgname=kwin4_effect_geometry_change
pkgname=kwin-effects-geometry-change
pkgver=1.5
pkgrel=1
pkgdesc='A KWin animation for windows moved or resized by programs or scripts'
arch=('any')
url="https://github.com/peterfajdiga/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('kwin')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver//./_}.tar.gz")
sha256sums=('76651a24465f83c832eb96dc9d34b3ac12c75d1b71298c2ac461a8a4b2cc0850')

package() {
    install -D -o root -m 755 -d "$pkgdir/usr/share/kwin/effects/${_pkgname}"
    cp -r ${_pkgname}/* "$pkgdir/usr/share/kwin/effects/${_pkgname}/"
}
