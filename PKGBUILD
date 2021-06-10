# Maintainer: Aitor Alonso <contact: https://aalonso.eu>


pkgname=qogir-icon-theme
_pkgname=Qogir-icon-theme
pkgver=2020.11.22
_pkgver=2020-11-22
pkgrel=1
pkgdesc="A colorful design icon theme for linux desktops"
arch=('any')
url="https://www.pling.com/p/1296407"
license=('GPL3')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vinceliuice/$_pkgname/archive/$_pkgver.tar.gz")
sha256sums=('865af80b101850728ba5bbb3a8e38d15074d2f5f5cb2b13203c51ea4ce45a3c1')

package() {
	cd "$_pkgname-$_pkgver"
	install -d "$pkgdir/usr/share/icons"
	./install.sh -d "$pkgdir/usr/share/icons"
}

