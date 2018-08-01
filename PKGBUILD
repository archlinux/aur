# Maintainer: livix <gatti.oliver@gmail.com>
pkgname=gazie
pkgver=7.10
pkgrel=1
pkgdesc="Multicompany finance application written in PHP using a MySql database backend for small to medium enterprise."
arch=('any')
url="http://gazie.devincentiis.it/"
license=('GPL')
depends=()
install=gazie.install
source=(http://freefr.dl.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname$pkgver.zip)
md5sums=('d0081b7998e029a2632421945b5ce7af')

package() {
	_instdir=$pkgdir/srv/http/gazie
	mkdir -p ${_instdir}

	# copy gazie sources to _instdir
	cd ${_instdir}
	cp -r $srcdir/gazie/{*,.htaccess} ${_instdir}
}

