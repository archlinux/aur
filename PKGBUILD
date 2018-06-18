# Maintainer: Andreas Linz <alinz@klingt.net>

pkgname=vegeta
pkgver=8.0.0
pkgrel=1
pkgdesc='a versatile HTTP load testing tool'
arch=('x86_64')
url='https://github.com/tsenart/vegeta/releases'
license=('MIT')
depends=()
makedepends=()
optsdepends=()
source=("https://github.com/tsenart/vegeta/releases/download/v$pkgver/$pkgname-$pkgver-linux-amd64.tar.gz")
md5sums=('a2a565dd8a9c29a3c86f8e7005e3f375')

package() {
    install -d $pkgdir/usr/bin
	cd $srcdir
	chmod 755 vegeta
	cp vegeta $pkgdir/usr/bin
}
