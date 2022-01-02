pkgname=cdpr-lldp
pkgver=3.0.4
pkgrel=1
pkgdesc="A fork of CDPR to decode CDP and LLDP packets"
url="https://github.com/tdorssers/cdpr-3.0"
license=('GPL')
arch=('i686' 'x86_64')
depends=('libpcap')
source=(https://github.com/tdorssers/cdpr-3.0/archive/master.zip)
md5sums=(SKIP)

build() {
  cd $srcdir/cdpr-3.0-master
  make
}

package() {
  cd $srcdir/cdpr-3.0-master
  install -D -m 0755 $srcdir/cdpr-3.0-master/cdpr $pkgdir/usr/bin/cdpr
}
