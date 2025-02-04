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

sha256sums=('d2743a57a1f8991d5dc073852bc62122455dd94f194d5a666a013572c702eb28')
