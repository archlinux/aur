# Maintainer: Egor Gushcha <egorts04@gmail.com>

pkgname=simple-and-soft-cursor
pkgver=0.2
pkgrel=2
pkgdesc="A simple and soft X cursor theme"
arch=('any')
url="https://store.kde.org/p/999946/"
license=('GPL')
source=("https://github.com/red-magic/dotfiles/raw/master/themes/cursor-themes/simple-and-soft.tar.xz")
sha256sums=('9a9dcc5e18f96225fd8315673f1f7430b2a9bb89d810717cf3b71647c37fbbb5')

package() {
  mkdir -p "$pkgdir/usr/share/icons/simple-and-soft"
  cp -R "$srcdir/simple-and-soft/cursors" \
	"$pkgdir/usr/share/icons/simple-and-soft/cursors"
  install -Dm644 "$srcdir/simple-and-soft/index.theme" \
	"$pkgdir/usr/share/icons/simple-and-soft/index.theme"
}
