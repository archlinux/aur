# Maintainer: Charlton Moren <charlton.moren@gmail.com>
pkgname=miku-cursor-theme
pkgver=1.2.6
pkgrel=1
pkgdesc="Miku Cursor — Hatsune Miku themed X11/Wayland cursor theme"
arch=('any')
url="https://www.gnome-look.org/p/2124099"
license=('custom')
source=("$pkgname-$pkgver.tar.xz::https://github.com/veasman/kara-cursor-mirror/releases/download/v1/miku-cursor-linux-1.2.6.tar.xz")
sha256sums=('6a13eec3928937575bc35435410f276410c899245d0ca98c7f9e1cc23f1f2689')

package() {
	install -dm755 "$pkgdir/usr/share/icons"
	cp -r "$srcdir/miku-cursor-linux" "$pkgdir/usr/share/icons/miku-cursor-linux"
	chmod -R u=rwX,go=rX "$pkgdir/usr/share/icons/miku-cursor-linux"
}
