# Maintainer: Jaro Habiger <jarohabiger@gmail.com>
# Contributor: Robin Heinemann <robin.ole.heinemann@gmail.com>

pkgname=hterm
pkgver=0.8.6
pkgrel=1
pkgdesc="HTerm serial terminal"
arch=("x86_64")
url="http://www.der-hammer.info/terminal"
license=(properitary)
depends=("gtk2" "libpng" "libsm")
optdepends=()
conflicts=(hterm-32)

source=("hterm.png" "hterm.desktop" "http://www.der-hammer.info/terminal/hterm086-linux-64.tgz")
sha256sums=('358862a79e6a88ca07dc86faa5e29d862bbf2aa2ca16e7f43e2f00a8c444e683'  
	    'fba0a7159c9187bfe8d2c7f63611bf4c2193a69566566bca79f2ce3ff46073f7'  
	    '30978f8a1e7c4391d0bbf94e09415039a8a3a7dd0f455d2531b041ae02a892b8')

package() {
	install -d "$pkgdir"/usr/bin
	install -Dm755 "$srcdir"/hterm "$pkgdir"/usr/bin/hterm
	install -Dm644 "$srcdir"/hterm.desktop "$pkgdir"/usr/share/applications/hterm.desktop
	install -Dm644 "$srcdir"/hterm.png "$pkgdir"/usr/share/pixmaps/hterm.png
}
