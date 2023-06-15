# Maintainer: Shijo_Rei <fun6680@naver.com>

_pkgname='Stylish-icon-theme-Adwaita'
pkgname=${_pkgname@L}
pkgver=23.06a
pkgrel=1
pkgdesc=" Modern icon theme for Linux Desktops with Adwaita Folder"
arch=('any')
url="https://github.com/mjkim0727/Stylish-icon-theme"
license=('GPLv3')
depends=('stylish-icon-theme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mjkim0727/Stylish-icon-theme/releases/download/$pkgver/Stylish-Adwaita.tar.gz")
sha256sums=('1594642b026b797140bec317aca8ab1d5e3a428ffd1c30c8074f8d22c28b33bf')

package() (
        install -d "$pkgdir/usr/share/icons"
        cp -r ${srcdir}/Stylish* ${pkgdir}/usr/share/icons
)
