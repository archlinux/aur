# Maintainer: Katlyn Lorimer <aur@katlyn.dev>
# Contributor: Jaro Habiger <jarohabiger@gmail.com>
# Contributor: Robin Heinemann <robin.ole.heinemann@gmail.com>

pkgname=hterm
pkgver=0.8.9
pkgrel=1
pkgdesc="HTerm serial terminal"
arch=("x86_64")
url="http://www.der-hammer.info/terminal"
license=(properitary)
depends=("gtk2" "libpng" "libsm")
optdepends=()
conflicts=(hterm-32)

source=("hterm.png" "hterm.desktop" "https://www.der-hammer.info/terminal/hterm089-linux-64.tgz")
sha256sums=('358862a79e6a88ca07dc86faa5e29d862bbf2aa2ca16e7f43e2f00a8c444e683'
	    'fba0a7159c9187bfe8d2c7f63611bf4c2193a69566566bca79f2ce3ff46073f7'
	    '0d8f97ec5694d5405b35ffca832e13cc1662a1c438fd3a495b728b5b58aed0cd')

package() {
	install -d "$pkgdir"/usr/bin
	install -Dm755 "$srcdir"/hterm "$pkgdir"/usr/bin/hterm
	install -Dm644 "$srcdir"/hterm.desktop "$pkgdir"/usr/share/applications/hterm.desktop
	install -Dm644 "$srcdir"/hterm.png "$pkgdir"/usr/share/pixmaps/hterm.png
}
