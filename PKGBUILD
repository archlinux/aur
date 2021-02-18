pkgname='gomclauncher-bin'
pkgver='1.3.8'
pkgrel=1
epoch=
pkgdesc='gml: A Minecraft Launcher'
arch=('any')
url='https://github.com/xmdhs/gomclauncher'
license=('MIT')
depends=()
makedepends=()
source=("https://github.com/xmdhs/gomclauncher/releases/download/v$pkgver/gml-linux.gz"
	"https://raw.githubusercontent.com/xmdhs/gomclauncher/v$pkgver/LICENSE")

md5sums=('c0254663859fc9c9cac477582d06d105'
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
