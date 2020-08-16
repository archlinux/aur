pkgname='gomclauncher-bin'
pkgver='1.2.5'
pkgrel=1
epoch=
pkgdesc='gml: A Minecraft Launcher'
arch=('any')
url='https://github.com/xmdhs/gomclauncher'
license=('MIT')
depends=()
makedepends=()
source=("https://github.com/xmdhs/gomclauncher/releases/download/v$pkgver/gml-linux"
	"https://raw.githubusercontent.com/xmdhs/gomclauncher/v$pkgver/LICENSE.txt")

md5sums=('a77baf2ad47e549f88bf43009ab804ac'
         '47d894a54821060b37984df5ee85c467')

prepare() {
	cd $srcdir
}

package() {
    cd $srcdir
	mkdir -p "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/licenses/gomclauncher/"
	install -Dm755 "$srcdir/gml-linux" "$pkgdir/usr/bin/gml"
	install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/gomclauncher/LICENSE"
}
