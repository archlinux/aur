# Maintainer: Kolei Chen <chenkolei at gmail dot com>

pkgname=xosview2
pkgver=2.2.1
pkgrel=1
pkgdesc="A lightweight system monitor"
url="http://xosview.sourceforge.net/"
license=('GPL' 'BSD')
arch=('x86_64')
depends=('gawk' 'libxext' 'gcc' 'libxft' 'libxpm' 'libsm')
source=("https://downloads.sourceforge.net/project/xosview/xosview2-2.2.1.tar.gz")
sha256sums=('6f72c0efb5e87131fdb9108da66210532f233e51b630ff19113350d7597adc84')

prepare() {
cd $srcdir/$pkgname-$pkgver
./configure --prefix=$pkgdir/usr
}

build() {
cd $srcdir/$pkgname-$pkgver
make $MAKEFLAGS
}

package() {
cd $srcdir/$pkgname-$pkgver
make install
}

