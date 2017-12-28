pkgname=sss-cli
pkgver=`date +%Y%m%d`
pkgrel=1
pkgdesc='Command line tool for secret sharing strings.'
arch=('i686' 'x86_64')
url=https://github.com/dsprenkels/sss-cli
license=('MIT')
depends=()
makedepends=('rust')
# source=()
# sha256sums=()

build() {
	
	cargo install -j 8 --root $srcdir --git $url

}

package() {

	mkdir --parents $pkgdir/usr/bin
	mv $srcdir/bin/* $pkgdir/usr/bin/.

}
