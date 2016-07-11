# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: FadeMind <fademind@gmail.com>

_pkgname=breeze-thin-dark
pkgname=yakuake-skin-${_pkgname}
pkgver=0.1
pkgrel=4
pkgdesc="A Breeze Thin Dark skin for Yakuake (Plasma 5)"
arch=('any')
url="http://opendesktop.org/content/show.php?content=169026"
license=('GPL')
depends=('yakuake')
replaces=("${pkgname}-frameworks")
conflicts=("${pkgname}-frameworks")
source=("${_pkgname}.tar.gz::https://opendesktop.org/CONTENT/content-files/169026-${_pkgname}.tar.gz")
source=("${_pkgname}.tar.gz::https://dl.opendesktop.org/api/files/download/id/1464803512/169026-{_pkgname}.tar.gz")
sha256sums=('0ccf4904014fd40303ab19a0c2b671cca2bc9d625c5448da9be73a072d5cd968')

package() {
    cd ${srcdir}
    find ${_pkgname}/* -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/yakuake/skins/{}" \;
}
