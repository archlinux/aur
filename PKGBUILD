# Maintainer: M0Rf30

pkgname=ostinato
pkgver=0.6
pkgrel=1
url="http://code.google.com/p/ostinato/"
pkgdesc="Cross-platform network packet/traffic generator and analyzer"
source=("http://dl.bintray.com/pstavirs/ostinato/ostinato-src-$pkgver.tar.gz")
arch=('i686' 'x86_64')
depends=('protobuf' 'qt4' 'libpcap')
optdepends=('wireshark' 'tshark' 'gzip' 'diff' 'awk')
license=(GPL)

build(){
   cd $srcdir/$pkgname-$pkgver
   qmake-qt4 PREFIX=$pkgdir/usr
   make
}

package(){
   cd $srcdir/$pkgname-$pkgver
   make install
}

md5sums=('0e6f825179ab01b77f00042172afe921')
