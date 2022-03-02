# Maintainer: Andre Schneider <andre.schneider@outlook.at>

pkgname=sweet-dark-theme
_pkgname=Sweet-Dark
pkgver=3.0
pkgrel=1
pkgdesc="Dark colorful Gtk3.20+ theme"
arch=('any')
url="https://github.com/EliverLara/Sweet"
license=('GPL3')
options=('!strip')
source=("$_pkgname.zip::$url/releases/download/v$pkgver/$_pkgname.zip")
sha256sums=('SKIP')

package() {
    install -d ${pkgdir}/usr/share/themes
    cp -r ${_pkgname} ${pkgdir}/usr/share/themes/
    find ${pkgdir}/usr/share/themes/${_pkgname} -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr/share/themes/${_pkgname} -type d -exec chmod 755 {} \;
}
