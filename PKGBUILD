# Maintainer: Moritz Schönherr <moritz.schoenherr@gmail.com>

pkgname=mdbook
pkgver=v0.0.12
pkgrel=2
pkgdesc="Command line tool for books written in markdown language."
url="https://github.com/azerupi/mdBook"
arch=('x86_64' 'i686')
license=('MPL2')

if [[ "$CARCH" == "x86_64" ]]; then
	source=(https://github.com/azerupi/mdBook/releases/download/$pkgver/mdBook-$pkgver-x86_64-unknown-linux-gnu.tar.gz)

	md5sums=('b7e5e13a5ca86633c5be1092df058142')
else
	source=(https://github.com/azerupi/mdBook/releases/download/$pkgver/mdBook-$pkgver-i686-unknown-linux-gnu.tar.gz)

	md5sums=('a8d2761780eda9d96f79af277a1e5a8f')
fi

package() {

	install -D mdbook $pkgdir/usr/bin/mdbook

}
	
