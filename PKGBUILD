# Maintainer: Moritz Schönherr <moritz.schoenherr@gmail.com>

pkgname=mdbook
pkgver=v0.0.14
pkgrel=1
pkgdesc="Command line tool for books written in markdown language."
url="https://github.com/azerupi/mdBook"
arch=('x86_64' 'i686')
license=('MPL2')

if [[ "$CARCH" == "x86_64" ]]; then
	source=(https://github.com/azerupi/mdBook/releases/download/$pkgver/mdBook-$pkgver-x86_64-unknown-linux-gnu.tar.gz)

	md5sums=('b3843cb76592236cf23ea18e155351e7')
else
	source=(https://github.com/azerupi/mdBook/releases/download/$pkgver/mdBook-$pkgver-i686-unknown-linux-gnu.tar.gz)

	md5sums=('45d40bc05c19999e6b173cf7285b3ef3')
fi

package() {

	install -D mdbook $pkgdir/usr/bin/mdbook

}
	
