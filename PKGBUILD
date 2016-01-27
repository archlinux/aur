# Maintainer: Jack Random <jack (at) random.to>
# Contributor: FadeMind <fademind@gmail.com>

_pkgname=breeze-thin
pkgname=yakuake-skin-${_pkgname}-frameworks
pkgver=1.0
pkgrel=3
pkgdesc="A Breeze Thin skin for Yakuake (Plasma 5)"
arch=('any')
url="https://opendesktop.org/content/show.php?content=167531"
license=('GPL')
depends=('yakuake-frameworks-git')
source=("${_pkgname}.tar.gz::https://opendesktop.org/CONTENT/content-files/167531-breeze-thin.tar.gz")
sha256sums=('2364efefc5a89e2e6e975854ee1fcdc2963abd6ef825fdd86698a97a6c725399')

package() {
    cd ${srcdir}
    find ${_pkgname}/* -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/yakuake/skins/{}" \;
}  
