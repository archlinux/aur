# Maintainer: M0Rf30

pkgname=archive-mounter
pkgver=3
pkgrel=2
pkgdesc="Open with archive mounter nautilus menu entry"
arch=('any')
url="http://www.gnome.org"
license=('GPL3')
source=(mount-archive.desktop)
options=(!libtool !strip)
depends=('gvfs')

package() {
  cd $srcdir/
  mkdir -p $pkgdir/usr/share/applications 
  cp $srcdir/mount-archive.desktop $pkgdir/usr/share/applications/  
}

md5sums=('57527c23be43c43a77b7d9a5b8f00ae4')
