# Maintainer: Shijo_Rei <fun6680@naver.com>

_pkgname='Stylish-icon-theme-Adwaita'
pkgname=${_pkgname@L}
pkgver=23.06
pkgrel=1
pkgdesc=" Modern icon theme for Linux Desktops with Adwaita Folder"
arch=('any')
url="https://github.com/kuroehanako/Stylish-icon-theme"
license=('GPLv3')
depends=('stylish-icon-theme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kuroehanako/Stylish-icon-theme/releases/download/$pkgver/Stylish-Adwaita.tar.gz")
sha256sums=('88771cfeee0de1e0d29adac79cc8c05bf91c04951bda0120c84176c363aba449')

package() (
        install -d "$pkgdir/usr/share/icons"
        cp -r ${srcdir}/Stylish* ${pkgdir}/usr/share/icons
)
