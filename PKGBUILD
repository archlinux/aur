# Maintainer: Mélanie Chauvel (ariasuni) <perso at hack-libre dot org>

pkgbase=breeze-flat
pkgname=(breeze-light-flat breeze-dark-flat)
pkgver=1.1
pkgrel=1
_pkgdesc="with opaque backgrounds and without shadows"
pkgdesc="Breeze Light and Dark ${_pkgdesc}"
arch=('any')
url='https://store.kde.org/p/1215691/'
license=('LGPL3')
depends=('plasma-framework')
source=("${pkgbase}::git+https://framagit.org/ariasuni/${pkgbase}.git#tag=v${pkgver}")
md5sums=('SKIP')

package_breeze-light-flat() {
    pkgdesc="Breeze Light ${_pkgdesc}"
    package
}

package_breeze-dark-flat() {
    pkgdesc="Breeze Dark ${_pkgdesc}"
    package
}

package() {
    install -dm755 "${pkgdir}/usr/share/plasma/desktoptheme"
    cp -r ${srcdir}/${pkgbase}/${pkgname} ${pkgdir}/usr/share/plasma/desktoptheme
}
