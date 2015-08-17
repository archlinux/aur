# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=papirus
pkgname=yakuake-skin-${_pkgname}
pkgver=0.1
pkgrel=2
pkgdesc="Papirus skin for Yakuake (KDE4)"
arch=('any')
url="http://opendesktop.org/content/show.php?content=170774"
license=('CCPL:by-sa')
depends=('yakuake')
conflicts=('papirus-yakuake-theme')
source=("${_pkgname}.tar.gz::http://opendesktop.org/CONTENT/content-files/170774-${_pkgname}.tar.gz")
sha256sums=('00ed6e31fdf7b3309a9491b08f02536295d847e0c7a4800014d25be9bf077a52')

package() {
    cd ${srcdir}
    find * -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/apps/yakuake/skins/{}" \;
}  
