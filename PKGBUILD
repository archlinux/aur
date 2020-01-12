pkgname=simple-and-soft-cursor
pkgver=0.2
pkgrel=6
pkgdesc="A simple and soft X cursor theme"
arch=('any')
url="https://store.kde.org/p/999946/"
license=('GPL')
source=("https://github.com/red-magic/dotfiles/raw/master/themes/cursor-themes/simple-and-soft.tar.zst")
sha256sums=('5048717412c85b3cbd45fc37f6724457fe1867e97fb8757b2d42ccb4fd8818e5')

package() {
  mkdir -p "$pkgdir/usr/share/icons/simple-and-soft"
  cp -R "$srcdir/simple-and-soft/cursors" \
	"$pkgdir/usr/share/icons/simple-and-soft/cursors"
  install -Dm644 "$srcdir/simple-and-soft/index.theme" \
	"$pkgdir/usr/share/icons/simple-and-soft/index.theme"
}
