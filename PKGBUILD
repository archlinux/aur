# Maintainer: Moritz Schönherr <moritz.schoenherr@gmail.com>

pkgname=mdbook
pkgver=0.0.21
pkgrel=1
pkgdesc="Command line tool for books written in markdown language."
url="https://github.com/azerupi/mdBook"
arch=('x86_64' 'i686')
license=('MPL2')

if [[ "$CARCH" == "x86_64" ]]; then
	source=(https://github.com/azerupi/mdBook/releases/download/$pkgver/mdBook-$pkgver-x86_64-unknown-linux-gnu.tar.gz)

	md5sums=('7625a82c32e292d8856f66be72aa0db4')
else
	source=(https://github.com/azerupi/mdBook/releases/download/$pkgver/mdBook-$pkgver-i686-unknown-linux-gnu.tar.gz)

	md5sums=('2d5805ab056302d44501f7e598d2f9ad')
fi

package() {

	install -D mdbook $pkgdir/usr/bin/mdbook

}
	
