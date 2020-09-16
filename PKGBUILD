pkgname='gomclauncher-bin'
pkgver='1.2.6'
pkgrel=1
epoch=
pkgdesc='gml: A Minecraft Launcher'
arch=('any')
url='https://github.com/xmdhs/gomclauncher'
license=('MIT')
depends=()
makedepends=()
source=("https://github.com/xmdhs/gomclauncher/releases/download/v$pkgver/gml-linux"
	"https://raw.githubusercontent.com/xmdhs/gomclauncher/v$pkgver/LICENSE")

md5sums=('00e0bb5424692fde347ffb57bcbfc7c2'
         'aca4188a0e8807e4aecc6b293f32ce42')

prepare() {
	cd $srcdir
}

package() {
    cd $srcdir
	mkdir -p "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/licenses/gomclauncher/"
	install -Dm755 "$srcdir/gml-linux" "$pkgdir/usr/bin/gml"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/gomclauncher/LICENSE"
}
