# Maintainer: SanskritFritz (gmail)

pkgname=sitecopy
pkgver=0.16.6
pkgrel=1
pkgdesc="Easily maintain remote web sites to keep them synchronized with the local site with a single command."
arch=('i686' 'x86_64')
url="http://www.manyfish.co.uk/sitecopy/"
license=('GPL')
depends=()
makedepends=()
source=("http://www.manyfish.co.uk/sitecopy/sitecopy-$pkgver.tar.gz")
md5sums=('b3aeb5a5f00af3db90b408e8c32a6c01')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
