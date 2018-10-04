# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: FadeMind <fademind@gmail.com>

_pkgname=breeze-thin-dark
pkgname=yakuake-skin-${_pkgname}
pkgver=0.2
pkgrel=1
pkgdesc="A Breeze Thin Dark skin for Yakuake (Plasma 5)"
arch=('any')
url="http://opendesktop.org/content/show.php?content=169026"
license=('GPL')
depends=('yakuake')
replaces=("${pkgname}-frameworks")
conflicts=("${pkgname}-frameworks")
source=("${_pkgname}.tar.gz::https://dl.opendesktop.org/api/files/download/id/1520795169/s/7bdeddc40afcfbe699e5fdc0cc10304f/t/1538665252/u//${_pkgname}.tar.gz")
sha256sums=('f72ab2c14c9e13894318a694bd61713fa31c660c31822e8992a2e57e24f76a44')

package() {
    cd ${srcdir}
    find ${_pkgname}/* -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/yakuake/skins/{}" \;
}
