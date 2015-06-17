# Maintainer: M0Rf30

pkgname=libxcm
pkgver=0.5.3
pkgrel=1
pkgdesc="A library containing the a reference implementation of the net-color specs"
url="http://oyranos.org/"
arch=('i686' 'x86_64')   
depends=('xorg-server')
source=("http://prdownloads.sourceforge.net/oyranos/libXcm-$pkgver.tar.bz2")
license=('MIT')

package() {
    cd $srcdir/libXcm-$pkgver
    ./configure --prefix=/usr
    make
    make DESTDIR=$pkgdir install
}

md5sums=('c5d293b235f98f0bd211678ffefebc4c')
