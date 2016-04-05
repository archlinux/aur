# Maintainer: Andreas Linz <alinz@klingt.net>

pkgname=vegeta
pkgver=6.1.0
pkgrel=1
pkgdesc='a versatile HTTP load testing tool'
arch=('x86_64')
url='https://github.com/tsenart/vegeta/releases'
license=('MIT')
depends=()
makedepends=()
optsdepends=()
source=("https://github.com/tsenart/vegeta/releases/download/v$pkgver/$pkgname-v$pkgver-linux-amd64.tar.gz")
md5sums=('3e07568748a468cc98435f5f413c0311')

package() {
    install -d $pkgdir/usr/bin
	cd $srcdir
	chmod 755 vegeta
	cp vegeta $pkgdir/usr/bin
}
