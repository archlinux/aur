# Maintainer: Aitor Alonso <contact: https://aalonso.eu>


_pkgname=Qogir-icon-theme
_pkgver=2021-07-14
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
sha256sums=('a5c0eb8476105c50a6a7b500496e188c100a5498caf3b548c2081c352ce99fc4')

package() {
	cd "$_pkgname-$_pkgver"
	install -d "$pkgdir/usr/share/icons"
	./install.sh -d "$pkgdir/usr/share/icons"
}
