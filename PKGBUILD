# Maintainer: Daniel Campoverde [alx741] <alx741@riseup.net>

pkgname=ratmen
pkgver=2.2.3
pkgrel=1
pkgdesc="A simple program to create X menus from the command line"
arch=('i686' 'x86_64')
url="http://www.update.uu.se/~zrajm/programs/"
license=('unknow')
depends=('libx11')
source=("http://www.update.uu.se/~zrajm/programs/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('4cc8de0f3138d9eacb06f08292df6294')

build() {
	cd "${srcdir}"/$pkgname-$pkgver
	make
}

package() {
	cd "${srcdir}"/$pkgname-$pkgver
	make PREFIX="$pkgdir/" install
}
