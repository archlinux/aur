# Maintainer: Jack Random <jack (at) random.to>
# Contributor: FadeMind <fademind@gmail.com>

_pkgname=breeze-gruvbox-dark
pkgname=yakuake-skin-${_pkgname}-frameworks
pkgver=0.0.1
pkgrel=1
pkgdesc="A Yakuake theme to match vim gruvbox retro theme. KF5 version"
arch=('any')
url="https://opendesktop.org/content/show.php?content=170824"
license=('CCPL:by-sa')
depends=('yakuake-frameworks-git')
makedepends=('unzip')
source=("${_pkgname}.zip::https://opendesktop.org/CONTENT/content-files/170824-${_pkgname}.zip")
sha256sums=('e4c4b0a7b5766cf946222a680cf806bbf9bf9996f9146fecc1e7cad4edbf404a')

package() {
    cd ${srcdir}
    find ${_pkgname}/* -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/yakuake/skins/{}" \;
}  
