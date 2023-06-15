# Maintainer: Shijo_Rei <fun6680@naver.com>

_pkgname='Stylish-icon-theme-Color'
pkgname=${_pkgname@L}
pkgver=23.06a
pkgrel=1
pkgdesc=" Modern icon theme for Linux Desktops with KDE ColorScheme"
arch=('any')
url="https://github.com/mjkim0727/Stylish-icon-theme"
license=('GPLv3')
depends=('stylish-icon-theme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mjkim0727/Stylish-icon-theme/releases/download/$pkgver/Stylish-Color.tar.gz")
sha256sums=('d666fa7baf762bf425477b83e87c32e2d500bf82e71c2c61b484cb80103365c6')

package() (
        install -d "$pkgdir/usr/share/icons"
        cp -r ${srcdir}/Stylish* ${pkgdir}/usr/share/icons
)
