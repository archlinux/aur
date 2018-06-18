# Maintainer: Acidhub <dev@acidhub.click>

pkgname=xcursor-theme-wii
pkgver=0.3.1
pkgrel=2
pkgdesc="Complete port of the 'Wii Cursors' theme by allewun"
arch=('any')
url="https://www.gnome-look.org/content/show.php/Wii+Cursors?content=100367"
license=('GPL')
conflicts=('')

source=('http://acidhub.click/downloads/WiiCursorTheme-0.3.1.tar.gz')

md5sums=('7fa791c9ea62fd3257a642fe594bc69d')

package() {
  mkdir -pm755 "$pkgdir/usr/share/icons/"
  cp -r "WiiCursorTheme" "$pkgdir/usr/share/icons/"
  cp -r "WiiCcwCursorTheme" "$pkgdir/usr/share/icons/"
}
