# Maintainer: AUTplayed <fips.hem@gmail.com>
# Contributor: pavanjadhaw <pavanjadhaw96@gmail.com>
pkgname=betterlockscreen
pkgver=2.0
pkgrel=1
pkgdesc="A simple lock script for i3lock-color"
arch=('any')
url="https://github.com/pavanjadhaw/${pkgname}"
license=('MIT')
depends=('i3lock-color' 'imagemagick' 'xorg-xrandr' 'xorg-xdpyinfo' 'bc')
optdepends=('feh: Allows setting wallpaper')
conflicts=("betterlockscreen-git")
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=("4e34eb32585d8cdac43bb0a6a004d148")

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	mkdir -p $pkgdir/usr/bin
	cp "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
