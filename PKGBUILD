pkgname=simple-and-soft-cursor
pkgver=0.2
pkgrel=7
pkgdesc="A simple and soft X cursor theme"
arch=('any')
url="https://store.kde.org/p/999946/"
license=('GPL')
source=("https://github.com/red-magic/dotfiles/raw/master/themes/cursor-themes/simple-and-soft.tar.xz")
sha256sums=('6fa72d23cc8c0f7a6a2af2dad57534741e73659e22ad2ca98c146e0de3073433')

package() {
  mkdir -p "$pkgdir/usr/share/icons/simple-and-soft"
  cp -R "$srcdir/simple-and-soft/cursors" \
	"$pkgdir/usr/share/icons/simple-and-soft/cursors"
  install -Dm644 "$srcdir/simple-and-soft/index.theme" \
	"$pkgdir/usr/share/icons/simple-and-soft/index.theme"
}
