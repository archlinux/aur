# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=breeze-dark
pkgname=yakuake-skin-${_pkgname}
pkgver=1.0.3
pkgrel=1
pkgdesc="A Breeze Dark skin for Yakuake (KDE4)"
arch=('any')
url="http://opendesktop.org/content/content=170330"
license=('GPL')
depends=('yakuake')
source=("${_pkgname}.tar.xz::https://copy.com/jWvNPzWQFBDAlInB/breeze-dark.tar.xz?download=1")
sha256sums=('ea2fa363d9b8f2bb8e7a4cb5abbaa5f15f97e6868c152d9fb6f67ff0d032d882')

package() {
    cd ${srcdir}
    find breeze_dark/* -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/apps/yakuake/skins/{}" \;
    mv "${pkgdir}/usr/share/apps/yakuake/skins/breeze_dark" "${pkgdir}/usr/share/apps/yakuake/skins/${_pkgname}"
}  
