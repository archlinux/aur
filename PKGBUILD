# Maintainer: Egor Gushcha <egorts04@gmail.com>

pkgname=simple-and-soft-cursor
pkgver=0.2
pkgrel=1
pkgdesc="A simple and soft X cursor theme"
arch=('any')
url="https://store.kde.org/p/999946/"
license=('GPL')
# Added some missing cursors
source=("https://github.com/red-magic/dotfiles/raw/master/themes/cursor-themes/simple-and-soft.tar.xz")
sha256sums=('e044947b3d3ef5c4c091faa9980cce2b0b0b89475e3a6a1b53df2daf39fd918c')

package() {
  mkdir -p "$pkgdir/usr/share/icons/simple-and-soft"
  cp -R "$srcdir/simple-and-soft/cursors" \
	"$pkgdir/usr/share/icons/simple-and-soft/cursors"
  install -Dm644 "$srcdir/simple-and-soft/index.theme" \
	"$pkgdir/usr/share/icons/simple-and-soft/index.theme"
}
