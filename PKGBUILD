# Maintainer: Ramana Kumar <first dot last at gmail.com>
pkgname=xcursor-ghost
pkgver=20040711
pkgrel=1
pkgdesc='Subtle grey cursors with soft edges'
arch=('any')
url='http://gnome-look.org/content/show.php/Ghost+Cursors?content=13090'
license=('GPL')
source=('http://gnome-look.org/CONTENT/content-files/13090-ghost.tar.bz2')
md5sums=('0090c9f3cfca07a1110964790a0084d2')

package() {
  mkdir -p "$pkgdir/usr/share/icons/ghost/cursors"
  cp -a "$srcdir/ghost/cursors/" "$pkgdir/usr/share/icons/ghost/"
  cp -a "$srcdir/ghost/index.theme" "$pkgdir/usr/share/icons/ghost/"
}

# vim:set ts=2 sw=2 et:
