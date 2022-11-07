# Maintainer: Aitor Alonso <contact: https://aalonso.eu>


_pkgname=Qogir-icon-theme
_pkgver=2022-11-05
pkgname=${_pkgname@L}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A colorful design icon theme for linux desktops"
arch=('any')
url="https://www.pling.com/p/1296407"
license=('GPL3')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vinceliuice/$_pkgname/archive/$_pkgver.tar.gz")
sha256sums=('7747f8a139e01a075a94b832d95a53a98b98784b06e866dd8259bb0a38404480')

package() {
	cd "$_pkgname-$_pkgver"
	install -d "$pkgdir/usr/share/icons"
	./install.sh -d "$pkgdir/usr/share/icons"
}
