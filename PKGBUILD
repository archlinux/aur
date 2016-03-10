# Maintainer: Jack Random <jack (at) random.to>
# Contributor: FadeMind <fademind@gmail.com>

_pkgname=breeze
pkgname=yakuake-skin-${_pkgname}
pkgver=1.0
pkgrel=5
pkgdesc="A Breeze skin for Yakuake (KF5)"
arch=('any')
url="https://opendesktop.org/content/show.php?content=167519"
license=('GPL')
depends=('yakuake')
source=("${_pkgname}.tar.gz::https://opendesktop.org/CONTENT/content-files/167519-breezeV1.0.tar.gz")
sha256sums=('d07a6769e5432faa704313bc81f2ec040276d34317f121641a2aeb548b937976')

package() {
    cd ${srcdir}
    find breezeV1.0/* -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/apps/yakuake/skins/{}" \;
}  
