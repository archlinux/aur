# Maintainer: Albert Kugel (Lastebil) (lastebilaur@trebel.org)
# Contributor: Will Smith (Factory, rpj8) <iliketoast@gmail.com>
# Contributor: Adrian Perez de Castro (aperez) <aperez@igalia.com>

pkgname=xcursor-gruppled
_pkgname=gruppled
pkgver=1.1
pkgrel=5
pkgdesc="An X11 theme by gruppler made entirely in Inkscape, inspired by Ghost Cursors"
arch=(any)
url="http://www.gnome-look.org/content/show.php/Gruppled+Cursors?content=86081"
license=('GPL')
depends=()
source=("https://dl.opendesktop.org/api/files/download/id/1460735377/s/c05e6075ac45799f1f844b15db3021df/t/1540753931/u//86081-gruppled.tar.gz")
sha512sums=('1f407dea6a8a0d3a71d29571d40f087e60df4dd4db01cfcf8e329fc12526ba5891be362383a8ef32b464ecb0569423acf24b81f599b15ba92244e54d1b8fdba7')

package() {
  mkdir -p "$pkgdir/usr/share/icons"

  rm -rf "${srcdir}"/*/Sources
  
  cp -r \
  "$srcdir/${_pkgname}_white" \
  "$srcdir/${_pkgname}_black" \
  "$pkgdir/usr/share/icons"
}
