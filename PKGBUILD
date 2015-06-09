# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=breeze-thin-dark
pkgname=yakuake-skin-${_pkgname}-frameworks
pkgver=0.1
pkgrel=2
pkgdesc="A Breeze Thin Dark skin for Yakuake (Plasma 5)"
arch=('any')
url="http://opendesktop.org/content/show.php?content=169026"
license=('GPL')
depends=('yakuake-frameworks-git')
source=("${_pkgname}.tar.xz::https://copy.com/D8s9BUKrpPeb3lQW/breeze-thin-dark.tar.xz?download=1")
sha256sums=('dbba7a8c9807742879b202f547f922fd1ffce646d41319b2ada111702abd480f')

package() {
    cd ${srcdir}
    find ${_pkgname}/* -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/yakuake/skins/{}" \;
}  
