# Contributor: Schnouki <thomas.jost@gmail.com>
pkgname=sobby
pkgver=0.4.4
pkgrel=2
pkgdesc="Standalone obby server"
url="http://gobby.0x539.de/trac/"
license="GPL"
depends=('obby' 'glibmm' 'libxml++2')
arch=('i686' 'x86_64')
source=(http://releases.0x539.de/sobby/sobby-$pkgver.tar.gz)
md5sums=('805f37a544567e649e1dcbb385683486')

build() {
  cd $startdir/src/sobby-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
