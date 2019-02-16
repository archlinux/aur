# Maintainer: Egor Gushcha <egorts04@gmail.com>

pkgname=simple-and-soft-cursor
pkgver=0.2
pkgrel=5
pkgdesc="A simple and soft X cursor theme"
arch=('any')
url="https://store.kde.org/p/999946/"
license=('GPL')
source=("https://github.com/red-magic/dotfiles/raw/master/themes/cursor-themes/simple-and-soft.tar.xz")
sha256sums=('68342a419076a32b0accf8bc6fa064f7bca17248e79432b638e994d1f19d1cd3')

package() {
  mkdir -p "$pkgdir/usr/share/icons/simple-and-soft"
  cp -R "$srcdir/simple-and-soft/cursors" \
	"$pkgdir/usr/share/icons/simple-and-soft/cursors"
  install -Dm644 "$srcdir/simple-and-soft/index.theme" \
	"$pkgdir/usr/share/icons/simple-and-soft/index.theme"
}
