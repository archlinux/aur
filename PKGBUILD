# Maintainer: Jack Random <jack (at) random.to>
# Contributor: FadeMind <fademind@gmail.com>

_pkgname=breeze-dark
pkgname=yakuake-skin-${_pkgname}-frameworks
pkgver=1.0.3
pkgrel=2
pkgdesc="A Breeze Dark skin for Yakuake (Plasma 5)"
arch=('any')
url="https://opendesktop.org/content/show.php?content=170330"
license=('GPL')
depends=('yakuake-frameworks-git')
source=("${_pkgname}.tar.gz::https://opendesktop.org/CONTENT/content-files/170330-breeze_dark.tar.gz")
sha256sums=('9d3f7a9c0eb3aeb65e6b9cfbb83e207113ec5a2a5d0a420c7a16b5db69a92912')

package() {
    cd ${srcdir}
    find breeze_dark/* -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/yakuake/skins/{}" \;
    mv "${pkgdir}/usr/share/yakuake/skins/breeze_dark" "${pkgdir}/usr/share/yakuake/skins/${_pkgname}"
}  
