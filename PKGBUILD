# Maintainer: George Woodall <georgewoodall82@gmail.com>
pkgname=openscad-thumbnailers
pkgver=1.0.1
pkgrel=1
pkgdesc="GTK thumbnailers for .scad and .stl files"
arch=('any')
url="https://github.com/georgewoodall82/openscad-thumbnailers"
license=('GPL-3.0-only')
depends=(openscad imagemagick xorg-server-xvfb)
makedepends=(git)
source=("$pkgname-$pkgver::git+https://github.com/georgewoodall82/openscad-thumbnailers.git")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname-$pkgver"
	git checkout tags/$pkgver
}

package() {
	cd "$pkgname-$pkgver"
	bash ./install.sh $pkgdir
}
