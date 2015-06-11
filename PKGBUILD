# Contributor: refujee <refujee@gmail.com>
pkgname=g15rhythmbox
pkgver=0.1
pkgrel=1
pkgdesc="A plugin to display Rhythmbox information on a Logitech G15 LCD"
arch=(i686 x86_64)
url="http://mail.gnome.org/archives/rhythmbox-devel/2008-July/msg00062.html"
license=('GPL')
depends=(g15composer g15daemon rhythmbox)
source=(http://www.mail-archive.com/rhythmbox-devel@gnome.org/msg05390/LogitechG15.tar.gz)
md5sums=('f3639f1776bcda47d428a45ac2b63973')

build() {
  cd $startdir/src/
  pwd 
  cp -R LogitechG15 /usr/lib/rhythmbox/plugins 
}

