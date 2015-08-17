# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=papirus-dark
pkgname=yakuake-skin-${_pkgname}-frameworks
pkgver=0.1
pkgrel=2
pkgdesc="Papirus Dark skin for Yakuake (Plasma 5)"
arch=('any')
url="http://opendesktop.org/content/show.php?content=170775"
license=('CCPL:by-sa')
depends=('yakuake-frameworks-git')
conflicts=('papirus-yakuake-theme')
source=("${_pkgname}.tar.gz::http://opendesktop.org/CONTENT/content-files/170775-${_pkgname}.tar.gz")
sha256sums=('033bb84f8f58caf455fb7e2042e9a07b01c1a627a6d815be8fd287d34706d59c')

package() {
    cd ${srcdir}
    find * -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/yakuake/skins/{}" \;
}  
