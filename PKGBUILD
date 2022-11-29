# Maintainer: Shijo_Rei <fun6680@naver.com>

_pkgname='Stylish-icon-theme'
pkgname=${_pkgname@L}
pkgver=1.4
pkgrel=1
pkgdesc=" Modern icon theme for Linux Desktops"
arch=('any')
url="https://github.com/kuroehanako/Stylish-icon-theme"
license=('GPLv3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kuroehanako/Stylish-icon-theme/archive/$pkgver.tar.gz")
optdepends=('stylish-icon-theme-adwaita: Adwaita Folder Colors')
sha256sums=('4c09dad6a567bf0ea0e8d31bbf1734a8933399f1eb30f3b144c84020bb3a69a5')

package() (
        cd "$_pkgname-$pkgver"
        install -d "$pkgdir/usr/share/icons"
        cp -r ${srcdir}/${_pkgname}-${pkgver}/src/Stylish* ${pkgdir}/usr/share/icons
)
