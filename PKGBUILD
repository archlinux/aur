# Maintainer: Shijo_Rei <fun6680@naver.com>

_pkgname='Stylish-icon-theme-Color'
pkgname=${_pkgname@L}
pkgver=23.08
pkgrel=1
pkgdesc=" Modern icon theme for Linux Desktops with KDE ColorScheme"
arch=('any')
url="https://github.com/mjkim0727/Stylish-icon-theme"
license=('GPLv3')
depends=('stylish-icon-theme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mjkim0727/Stylish-icon-theme/releases/download/$pkgver/Stylish-Color.tar.gz")
sha256sums=('82f9330899c6fa227acec7fe797070441c6270f10119de984486012e23b4f4de')

package() (
        install -d "$pkgdir/usr/share/icons"
        cp -r ${srcdir}/Stylish* ${pkgdir}/usr/share/icons
)
