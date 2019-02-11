# Maintainer: Egor Gushcha <egorts04@gmail.com>

pkgname=simple-and-soft-cursor
pkgver=0.2
pkgrel=2
pkgdesc="A simple and soft X cursor theme"
arch=('any')
url="https://store.kde.org/p/999946/"
license=('GPL')
source=("https://github.com/red-magic/dotfiles/raw/master/themes/cursor-themes/simple-and-soft.tar.xz")
sha256sums=('bedf6fb30035884a73528b6b7e40474eaa896f528be399c87a105f797f05eed3')

package() {
  mkdir -p "$pkgdir/usr/share/icons/simple-and-soft"
  cp -R "$srcdir/simple-and-soft/cursors" \
	"$pkgdir/usr/share/icons/simple-and-soft/cursors"
  install -Dm644 "$srcdir/simple-and-soft/index.theme" \
	"$pkgdir/usr/share/icons/simple-and-soft/index.theme"
}
