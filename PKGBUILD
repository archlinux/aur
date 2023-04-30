# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=dcraw-thumbnailer
pkgver=0.1.0
pkgrel=1
pkgdesc="RAW thumbnailer using dcraw"
arch=("any")
license=("MIT")
depends=("dcraw" "gdk-pixbuf2")
source=("dcraw-thumbnailer" "dcraw.thumbnailer")
md5sums=('8bd90a633492c4eee01bd661ac94e218' '3abe25fe277fbd0a550eb0dd78329b58')

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/thumbnailers"

  cp "$srcdir/dcraw-thumbnailer" "$pkgdir/usr/bin/"
  cp "$srcdir/dcraw.thumbnailer" "$pkgdir/usr/share/thumbnailers/"

  chmod +x "$pkgdir/usr/bin/dcraw-thumbnailer"
}
