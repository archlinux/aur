# Maintainer: Shijo_Rei <fun6680@naver.com>

_pkgname='Stylish-icon-theme-Color'
pkgname=${_pkgname@L}
pkgver=23.05
pkgrel=1
pkgdesc=" Modern icon theme for Linux Desktops with KDE ColorScheme"
arch=('any')
url="https://github.com/kuroehanako/Stylish-icon-theme"
license=('GPLv3')
depends=('stylish-icon-theme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kuroehanako/Stylish-icon-theme/releases/download/$pkgver/Stylish-Color.tar.gz")
sha256sums=('12b2b0a67bc48d12120287896cff96bf9eec3ef1a8bd435ca16a1de4bea50203')

package() (
        install -d "$pkgdir/usr/share/icons"
        cp -r ${srcdir}/Stylish* ${pkgdir}/usr/share/icons
)
