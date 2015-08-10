# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=velours
pkgname=yakuake-skin-${_pkgname}
pkgver=1.1
pkgrel=1
pkgdesc="Dark, monochromatic and translucent skin for Yakuake (KDE4)"
arch=('any')
url="http://opendesktop.org/content/show.php?content=170866"
license=('CCPL:by-sa')
depends=('yakuake')
source=("${_pkgname}.tar.gz::http://opendesktop.org/CONTENT/content-files/170866-${_pkgname}-yakuake.tar.gz")
sha256sums=('4df70237b6bd4ca1069ad4c3d571df5fa15cda87e37f112cac4f67143500162d')

package() {
    cd ${srcdir}/${_pkgname}-yakuake
    find * -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/apps/yakuake/skins/${_pkgname}/{}" \;
}  
