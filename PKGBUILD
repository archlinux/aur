# Maintainer: Jack Random <jack (at) random.to>
# Contributor: FadeMind <fademind@gmail.com>

_pkgname=velours
pkgname=yakuake-skin-${_pkgname}
pkgver=1.2
pkgrel=1
pkgdesc="Dark, monochromatic and translucent skin for Yakuake (KDE4)"
arch=('any')
url="https://opendesktop.org/content/show.php?content=170866"
license=('CCPL:by-sa')
depends=('yakuake')
source=("${_pkgname}.tar.gz::https://opendesktop.org/CONTENT/content-files/170866-${_pkgname}-yakuake.tar.gz")
sha256sums=('bce3bb36f64588f26caa8cba3f48642a882b0742e6d71a25e1b920905663c192')

package() {
    cd ${srcdir}/${_pkgname}-yakuake
    find * -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/apps/yakuake/skins/${_pkgname}/{}" \;
}  
