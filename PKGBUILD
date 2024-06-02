# Maintainer: George Woodall <georgewoodall82@gmail.com>
pkgname=openscad-thumbnailers
pkgver=1.0.2
pkgrel=1
pkgdesc="GTK thumbnailers for .scad, .stl and .3mf files"
arch=('any')
url="https://github.com/georgewoodall82/openscad-thumbnailers"
license=('GPL-3.0-only')
depends=(openscad imagemagick xorg-server-xvfb)
makedepends=(git)
source=("https://github.com/georgewoodall82/openscad-thumbnailers/archive/1.0.2.tar.gz")
sha256sums=('221579e100b63ccce5ba4eb9a567d1c2ded52a6fafb5f313e2b62162e3bf07ad')

package() {
	cd "$pkgname-$pkgver"
	bash ./install.sh $pkgdir
}
