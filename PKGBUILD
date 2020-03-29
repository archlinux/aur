# Maintainer: Jaro Habiger <jarohabiger@gmail.com>
# Contributor: Robin Heinemann <robin.ole.heinemann@gmail.com>

pkgname=hterm-32
pkgver=0.8.4
pkgrel=1
pkgdesc="HTerm serial terminal"
arch=("i686")
url="http://www.der-hammer.info/terminal"
license=(properitary)
depends=("lib32-gtk2" "lib32-libpng" "lib32-libsm")
optdepends=()
conflicts=(hterm)

source=("hterm.png" "hterm.desktop" "http://www.der-hammer.info/terminal/hterm085-linux-32.tgz")
sha256sums=('358862a79e6a88ca07dc86faa5e29d862bbf2aa2ca16e7f43e2f00a8c444e683'  
	    'fba0a7159c9187bfe8d2c7f63611bf4c2193a69566566bca79f2ce3ff46073f7'  
	    'aaf5f1afc9b3c0aad3bd7835fea6cc3e805a680a9c4a655d1bc39acf37f2ca92')

package() {
	install -d "$pkgdir"/usr/bin
	install -Dm755 "$srcdir"/hterm "$pkgdir"/usr/bin/hterm
	install -Dm644 "$srcdir"/hterm.desktop "$pkgdir"/usr/share/applications/hterm.desktop
	install -Dm644 "$srcdir"/hterm.png "$pkgdir"/usr/share/pixmaps/hterm.png
}
