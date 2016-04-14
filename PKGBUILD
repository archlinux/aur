# Maintainer: Moritz Schönherr <moritz.schoenherr@gmail.com>

pkgname=mdbook-bin
pkgver=v0.0.11
pkgrel=1
pkgdesc="Command line tool for books written in markdown language."
url="https://github.com/azerupi/mdBook"
arch=('x86_64' 'i686')
license=('MPL2')

if [[ "$CARCH" == "x86_64" ]]; then
	source=(https://github.com/azerupi/mdBook/releases/download/$pkgver/mdBook-$pkgver-x86_64-unknown-linux-gnu.tar.gz)

	md5sums=('1b626f4e594f39aa71bdb4a96be5ed97')
else
	source=(https://github.com/azerupi/mdBook/releases/download/$pkgver/mdBook-$pkgver-i686-unknown-linux-gnu.tar.gz)

	md5sums=('daa75e570ec2c4c68c061cb185630549')
fi

package() {

	install -D mdbook $pkgdir/usr/bin/mdbook

}
	
