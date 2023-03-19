# Maintainer: Shijo_Rei <fun6680@naver.com>

_pkgname='Stylish-icon-theme-Adwaita'
pkgname=${_pkgname@L}
pkgver=1.5
pkgrel=1
pkgdesc=" Modern icon theme for Linux Desktops with Adwaita Folder"
arch=('any')
url="https://github.com/kuroehanako/Stylish-icon-theme"
license=('GPLv3')
depends=('stylish-icon-theme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kuroehanako/Stylish-icon-theme/releases/download/$pkgver/Stylish-Adwaita.tar.gz")
sha256sums=('98a049da4a347541acbe4a1cb6b17f26860f2b304b3ce41e00882e784cc165b5')

package() (
        install -d "$pkgdir/usr/share/icons"
        cp -r ${srcdir}/Stylish* ${pkgdir}/usr/share/icons
)
