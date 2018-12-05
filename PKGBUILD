# Maintainer: quellen <lodgerz@gmail.com>
pkgname=cfourcc
pkgver=0.1.3.1
pkgrel=1
pkgdesc="Tool for changing FOURCC of an MPEG4 or DivX file"
arch=('i686' 'x86_64')
url="https://github.com/mypapit/cfourcc"
license=('GPL')
source=("https://github.com/mypapit/cfourcc/archive/$pkgver.zip")
md5sums=('b2cac787057aa18cfe540e6074ec85a0')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
mkdir -p "$pkgdir/usr/bin"
cp -p "$srcdir/$pkgname-$pkgver/cfourcc" "$pkgdir/usr/bin/"
} 
