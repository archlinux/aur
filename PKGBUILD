#Maintainer:xgdgsc<xgdgsc@gmail.com>

pkgname=qtcreator-doxygen
pkgver=0.4.4
pkgrel=1
pkgdesc="Doxygen Plugin for Qt Creator"
url=https://github.com/fpoussin/qtcreator-doxygen
arch=(x86_64)
depends=()
license=(MIT)


md5sums=('df8559cbc02280643603dbb129aa57a0')

source=("https://github.com/fpoussin/qtcreator-doxygen/releases/download/v0.4.4/libDoxygen-0.4.4-qtc4.1.x-x86_64.so")


package() {
    mkdir -p "${pkgdir}/usr/lib/qtcreator/plugins/"
    cp libDoxygen-$pkgver-qtc4.1.x-x86_64.so "${pkgdir}/usr/lib/qtcreator/plugins/"
}
