# Maintainer: Shijo_Rei <fun6680@naver.com>

_pkgname='Stylish-icon-theme-Adwaita'
pkgname=${_pkgname@L}
pkgver=23.05
pkgrel=1
pkgdesc=" Modern icon theme for Linux Desktops with Adwaita Folder"
arch=('any')
url="https://github.com/kuroehanako/Stylish-icon-theme"
license=('GPLv3')
depends=('stylish-icon-theme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kuroehanako/Stylish-icon-theme/releases/download/$pkgver/Stylish-Adwaita.tar.gz")
sha256sums=('8b5010caa84af66d3f5da7a8c63bdf68373612ab3de8e6d56e7448b21a2a4827')

package() (
        install -d "$pkgdir/usr/share/icons"
        cp -r ${srcdir}/Stylish* ${pkgdir}/usr/share/icons
)
