# Maintainer: Shijo_Rei <fun6680@naver.com>

_pkgname='Stylish-icon-theme'
pkgname=${_pkgname@L}
pkgver=23.06a
pkgrel=1
pkgdesc=" Modern icon theme for Linux Desktops"
arch=('any')
url="https://github.com/mjkim0727/Stylish-icon-theme"
license=('GPLv3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mjkim0727/Stylish-icon-theme/archive/$pkgver.tar.gz")
optdepends=('stylish-icon-theme-adwaita: Adwaita Folder Colors' 'stylish-icon-theme-color: Support KDE ColorScheme')
sha256sums=('0dfa6225f2549d4b324c05d732957ca2199b575f6c42ea019ea80085ebb65d70')

package() (
        cd "$_pkgname-$pkgver"
        install -d "$pkgdir/usr/share/icons"
        cp -r ${srcdir}/${_pkgname}-${pkgver}/src/Stylish* ${pkgdir}/usr/share/icons
)
