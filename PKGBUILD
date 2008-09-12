# Contributor: Schnouki <thomas.jost@gmail.com>
pkgname=sobby
pkgver=0.4.5
pkgrel=1
pkgdesc="Standalone obby server"
url="http://gobby.0x539.de/trac/"
license="GPL"
depends=('obby>=0.4.6' 'glibmm' 'libxml++2')
arch=('i686' 'x86_64')
source=(http://releases.0x539.de/sobby/sobby-$pkgver.tar.gz)
md5sums=('c59a5ea003fede807b82ed7bab7bf849')

build() {
  cd $startdir/src/sobby-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
