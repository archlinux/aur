# Maintainer: Shijo_Rei <fun6680@naver.com>

_pkgname='Stylish-icon-theme'
pkgname=${_pkgname@L}
pkgver=23.08
pkgrel=1
pkgdesc=" Modern icon theme for Linux Desktops"
arch=('any')
url="https://github.com/mjkim0727/Stylish-icon-theme"
license=('GPLv3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mjkim0727/Stylish-icon-theme/archive/$pkgver.tar.gz")
optdepends=('stylish-icon-theme-adwaita: Adwaita Folder Colors' 'stylish-icon-theme-color: Support KDE ColorScheme')
sha256sums=('4c72c472315197703258dc65edbcc6e82f77581f6df32ae4da042a23d836232a')

package() (
        cd "$_pkgname-$pkgver"
        install -d "$pkgdir/usr/share/icons"
        cp -r ${srcdir}/${_pkgname}-${pkgver}/src/Stylish* ${pkgdir}/usr/share/icons
)
