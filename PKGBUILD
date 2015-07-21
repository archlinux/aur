# Contributor: vit01 (vitirk) <me@ii-net.tk>

pkgname='iitxt-c-git'
pkgver='0.1'
pkgdesc="simple client for ii network written on C"
pkgrel=2
arch=('any')
depends=('curl' 'vim')
makedepends=('git')
license=('GPL3')
url="http://ii-net.tk/ii-doc"
source=('git+https://github.com/vit1-irk/iitxt-c/')
md5sums=('SKIP')

build() {
	cd $srcdir/iitxt-c/
	make
}
package() {
	cd $srcdir/iitxt-c/
	make DESTDIR=$pkgdir install
}
