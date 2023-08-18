# Maintainer: Shijo_Rei <fun6680@naver.com>

_pkgname='Stylish-icon-theme-Adwaita'
pkgname=${_pkgname@L}
pkgver=23.08
pkgrel=1
pkgdesc=" Modern icon theme for Linux Desktops with Adwaita Folder"
arch=('any')
url="https://github.com/mjkim0727/Stylish-icon-theme"
license=('GPLv3')
depends=('stylish-icon-theme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mjkim0727/Stylish-icon-theme/releases/download/$pkgver/Stylish-Adwaita.tar.gz")
sha256sums=('f61b7e29e798279bba1f02b87bc4630ab0f4c28f9c4bb73bf83c0b528e9f35f3')

package() (
        install -d "$pkgdir/usr/share/icons"
        cp -r ${srcdir}/Stylish* ${pkgdir}/usr/share/icons
)
