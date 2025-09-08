# Maintainer: Aitor Alonso <contact: https://aalonso.eu>


_pkgname=Qogir-icon-theme
_pkgver=2025-02-15
pkgname=${_pkgname@L}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A colorful design icon theme for linux desktops"
arch=('any')
url="https://www.pling.com/p/1296407"
license=('GPL-3.0')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vinceliuice/$_pkgname/archive/$_pkgver.tar.gz")
sha256sums=('b0d07cad5601e0341a53a62df0ed111823b75fc38741d435486620a59fb239ee')

package() {
	cd "$_pkgname-$_pkgver"
	install -d "$pkgdir/usr/share/icons"
	./install.sh -d "$pkgdir/usr/share/icons"
}
