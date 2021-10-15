# Maintainer: Aitor Alonso <contact: https://aalonso.eu>


_pkgname=Qogir-icon-theme
_pkgver=2021-10-14
pkgname=qogir-icon-theme
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A colorful design icon theme for linux desktops"
arch=('any')
url="https://www.pling.com/p/1296407"
license=('GPL3')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vinceliuice/$_pkgname/archive/$_pkgver.tar.gz")
sha256sums=('329032fb3a4e3d68a697dbea7fd4389a138c1da55a7433a1dc25803bda568d32')

package() {
	cd "$_pkgname-$_pkgver"
	install -d "$pkgdir/usr/share/icons"
	./install.sh -d "$pkgdir/usr/share/icons"
}
