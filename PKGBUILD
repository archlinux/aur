# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=breeze-gruvbox-dark
pkgname=yakuake-skin-${_pkgname}
pkgver=0.0.1
pkgrel=1
pkgdesc="Theme to match vim gruvbox retro theme for Yakuake (KDE4)"
arch=('any')
url="http://opendesktop.org/content/show.php?content=170824"
license=('CCPL:by-sa')
depends=('yakuake')
makedepends=('unzip')
source=("${_pkgname}.tar.xz::http://kde-look.org/CONTENT/content-files/170824-${_pkgname}.zip")
sha256sums=('e4c4b0a7b5766cf946222a680cf806bbf9bf9996f9146fecc1e7cad4edbf404a')

package() {
    cd ${srcdir}
    find ${_pkgname}/* -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/apps/yakuake/skins/{}" \;
}  
