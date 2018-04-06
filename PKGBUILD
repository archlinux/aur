# Maintainer: robertfoster

pkgname=xmysql
pkgver=0.4.4
pkgrel=1
pkgdesc="One command to generate REST APIs for any MySql Database"
arch=(i686 x86_64)
url="https://github.com/OpenBazaar/openbazaar-desktop"
license=('MIT')
depends=(npm)
makedepends=(npm)
source=("https://github.com/o1lab/xmysql/archive/v$pkgver.tar.gz")

package(){
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" --ignore-scripts --production xmysql@$pkgver
}

md5sums=('0c72d59428aa88fd834700b5fc21fd07')
