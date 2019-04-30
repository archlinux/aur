# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=xdrfile
pkgver=1.1.4
pkgrel=2
pkgdesc='Library for reading and writing xtc, edr and trr files'
license=("LGPL3")
arch=('i686' 'x86_64')
url="http://www.gromacs.org/Developer_Zone/Programming_Guide/XTC_Library"
makedepends=('git' 'gcc' 'm4' 'automake' 'autoconf')
source=("ftp://ftp.gromacs.org/pub/contrib/$pkgname-$pkgver.tar.gz")

build() {
    cd $srcdir/$pkgname-$pkgver

    ./configure --prefix=/usr --with-pic
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver

    make DESTDIR=${pkgdir} install
}
md5sums=('d992901d1bd7305b91d280ab85427c7b')
