#Maintainer: Mike Sampson <mike@sambodata.com>
#Contributor: Adam Strauch <creckx@gmail.com>
#Contributer: L42y <423300@gmail.com>

pkgname=daemon
pkgver=0.6.4
pkgrel=1
pkgdesc="Run any program as daemon"
arch=('i686' 'x86_64')
url="http://www.libslack.org/daemon/"
license=('GPL')
depends=()
source=("http://libslack.org/daemon/download/$pkgname-$pkgver.tar.gz")
md5sums=('6cd0a28630a29ac279bc501f39baec66')

build() {
    cd $srcdir/$pkgname-$pkgver
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR=$pkgdir PREFIX=$pkgdir/usr install
}
