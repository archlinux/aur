# Maintainer: Shijo_Rei <fun6680@naver.com>

_pkgname='Stylish-icon-theme'
pkgname=${_pkgname@L}
pkgver=1.3
pkgrel=1
pkgdesc=" Modern icon theme for Linux Desktops"
arch=('any')
url="https://github.com/kuroehanako/Stylish-icon-theme"
license=('GPLv3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kuroehanako/Stylish-icon-theme/archive/$pkgver.tar.gz")
optdepends=('stylish-icon-theme-adwaita: Adwaita Folder Colors')
sha256sums=('bd435584221292cb618babfe603aaaf3d7cf95689d6f3ddf1f5ed54e1f616692')

package() (
        cd "$_pkgname-$pkgver"
        install -d "$pkgdir/usr/share/icons"
        cp -r ${srcdir}/${_pkgname}-${pkgver}/src/Stylish* ${pkgdir}/usr/share/icons
)
