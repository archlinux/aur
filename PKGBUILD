# Maintainer: Shijo_Rei <fun6680@naver.com>

_pkgname='Stylish-icon-theme-Color'
pkgname=${_pkgname@L}
pkgver=23.06
pkgrel=1
pkgdesc=" Modern icon theme for Linux Desktops with KDE ColorScheme"
arch=('any')
url="https://github.com/kuroehanako/Stylish-icon-theme"
license=('GPLv3')
depends=('stylish-icon-theme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kuroehanako/Stylish-icon-theme/releases/download/$pkgver/Stylish-Color.tar.gz")
sha256sums=('27806c8ae01f61c55e6c0b4e1ab9c9f23f521a263d0a397a74762d0f165eff17')

package() (
        install -d "$pkgdir/usr/share/icons"
        cp -r ${srcdir}/Stylish* ${pkgdir}/usr/share/icons
)
