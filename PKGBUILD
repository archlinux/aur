# Maintainer: Shijo_Rei <fun6680@naver.com>

_pkgname='Stylish-icon-theme'
pkgname=${_pkgname@L}
pkgver=23.05
pkgrel=1
pkgdesc=" Modern icon theme for Linux Desktops"
arch=('any')
url="https://github.com/kuroehanako/Stylish-icon-theme"
license=('GPLv3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kuroehanako/Stylish-icon-theme/archive/$pkgver.tar.gz")
optdepends=('stylish-icon-theme-adwaita: Adwaita Folder Colors' 'stylish-icon-theme-color: Support KDE ColorScheme')
sha256sums=('bcf4db8ba37dd70c38bcff466f32770e543ce133b56e56138535cc4291393e66')

package() (
        cd "$_pkgname-$pkgver"
        install -d "$pkgdir/usr/share/icons"
        cp -r ${srcdir}/${_pkgname}-${pkgver}/src/Stylish* ${pkgdir}/usr/share/icons
)
