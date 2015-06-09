# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=breeze
pkgname=yakuake-skin-${_pkgname}
pkgver=1.0
pkgrel=2
pkgdesc="A Breeze skin for Yakuake (KDE4)"
arch=('any')
url="http://opendesktop.org/content/show.php?content=167519"
license=('GPL')
depends=('yakuake')
source=("${_pkgname}.tar.xz::https://copy.com/PyyxvzP1XCLLsG8Q/breeze.tar.xz?download=1")
sha256sums=('c2cd3f9e529d29fa5f29d4e35e27ba3f8d06e90cd449cfc325c5d648e874f654')

package() {
    cd ${srcdir}
    find ${_pkgname}/* -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/apps/yakuake/skins/{}" \;
}  
