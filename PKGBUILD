# Maintainer: Aitor Alonso <contact: https://aalonso.eu>


_pkgname=Qogir-icon-theme
_pkgver=2022-01-12
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
sha256sums=('afcd0955ead6f9ef73a801cb6fd5917d8ccdd655381b583312e418198d468e10')

package() {
	cd "$_pkgname-$_pkgver"
	install -d "$pkgdir/usr/share/icons"
	./install.sh -d "$pkgdir/usr/share/icons"
}
