# Maintainer: Albert Kugel (Lastebil) (lastebilaur@trebel.org)
# Contributor: Will Smith (Factory, rpj8) <iliketoast@gmail.com>
# Contributor: Adrian Perez de Castro (aperez) <aperez@igalia.com>

pkgname=xcursor-gruppled
_pkgname=gruppled
pkgver=1.1
pkgrel=4
pkgdesc="An X11 theme by gruppler made entirely in Inkscape, inspired by Ghost Cursors"
arch=(any)
url="http://www.gnome-look.org/content/show.php/Gruppled+Cursors?content=86081"
license=('GPL')
depends=()
source=("https://dl.opendesktop.org/api/files/download/id/1460735377/86081-$_pkgname.tar.gz")
md5sums=('3370fcb63f46a57e3c2b3e66ca715fba')

package() {
  mkdir -p "$pkgdir/usr/share/icons"
  
  cp -r \
  "$srcdir/${_pkgname}_white" \
  "$srcdir/${_pkgname}_black" \
  "$pkgdir/usr/share/icons"
}
