# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=mazespheres-bin
pkgver=1.1
pkgrel=1
pkgdesc='A horror-themed minimalistic maze game'

url='https://varden.info/product.php?sid=27'
arch=('x86_64')
license=('custom')

depends=()
optdepends=()
conflicts=()
source=("https://varden.info/~m/aur/Mazespheres-Linux-v1.1.tar.xz"
	"LICENSE"
	"mazespheres.sh")
sha256sums=("180dbe7369e6116d000698e2d3e77b8a3913bface1f21db6f59cdf689998a3d2"
	"f8c94c4c62bf8e900ac22bea2b17c7e5e2540cc2d09d4ee8e05dedb378cbd7d3"
	"3b698333e28f1cff1703e2109abc425228163c06339ed18794e8422931751c48")

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/opt/Mazespheres"
	mv Mazespheres_Linux.x86_64 Mazespheres_Linux_Data "$pkgdir/opt/Mazespheres"
	install -Dm 755 "mazespheres.sh" "$pkgdir/usr/bin/mazespheres"
	install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/mazespheres-bin/LICENSE"
}
