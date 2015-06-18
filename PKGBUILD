#Contributor:Paul Bragg <paul2lv@gmail.com>
pkgname=dvorak7min
pkgver=1.6.1
pkgrel=3
pkgdesc="dvorak7min is a simple ncurses-based typing tutor for those trying to become fluent with the Dvorak keyboard layout"
arch=('i686' 'x86_64')
license=('GPL')
url="http://packages.debian.org/unstable/games/dvorak7min"
depends=('ncurses')
source=(http://ftp.de.debian.org/debian/pool/main/d/dvorak7min/dvorak7min_1.6.1.orig.tar.gz)
md5sums=('0dbeb1ac986893f1b14f70e392b9009e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  _installdir="$startdir/pkg/usr/bin"
  make INSTALL=$_installdir || return 1
  make INSTALL=$_installdir install || return 1 
}
