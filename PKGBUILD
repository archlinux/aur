# Maintainer: robertfoster

pkgname=archive-mounter
pkgver=4
pkgrel=1
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

md5sums=('7769f421c18f3ce3d97b435940603e02')
