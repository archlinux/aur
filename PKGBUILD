# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=breeze-thin
pkgname=yakuake-skin-${_pkgname}-frameworks
pkgver=1.0
pkgrel=2
pkgdesc="A Breeze Thin skin for Yakuake (Plasma 5)"
arch=('any')
url="http://opendesktop.org/content/show.php?content=167531"
license=('GPL')
depends=('yakuake-frameworks-git')
source=("${_pkgname}.tar.xz::https://copy.com/T6e4mpX30K8j7bek/breeze-thin.tar.xz?download=1")
sha256sums=('96a058698a18f4fc5be1a82fea608be1e67564552f481ba5bc7a1e4c2348db05')

package() {
    cd ${srcdir}
    find ${_pkgname}/* -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/yakuake/skins/{}" \;
}  
