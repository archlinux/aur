# Maintainer: Charlton Moren <charlton.moren@gmail.com>
pkgname=koishi-komeiji-cursor-theme
pkgver=1.0
pkgrel=1
pkgdesc="Koishi Komeiji — X11/Wayland cursor theme (Touhou Project)"
arch=('any')
url="https://www.gnome-look.org/p/1847757"
license=('custom')
source=("$pkgname-$pkgver.zip::https://github.com/veasman/kara-cursor-mirror/releases/download/v1/Koishi.zip")
sha256sums=('6d98538495e298ab2c27892a403dc2177e6637a2953545d8bbc0eeec86c705f9')

package() {
	install -dm755 "$pkgdir/usr/share/icons"
	cp -r "$srcdir/Koishi" "$pkgdir/usr/share/icons/Koishi"
	chmod -R u=rwX,go=rX "$pkgdir/usr/share/icons/Koishi"
}
