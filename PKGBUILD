# Maintainer: Andreas Linz <alinz@klingt.net>

pkgname=vegeta
pkgver=5.9.0
pkgrel=1
pkgdesc='a versatile HTTP load testing tool'
arch=('x86_64')
url='https://github.com/tsenart/vegeta/releases'
license=('MIT')
depends=()
makedepends=()
optsdepends=()
source=("https://github.com/tsenart/vegeta/releases/download/v$pkgver/$pkgname-v$pkgver-linux-amd64.tar.gz")
md5sums=('abf3035cb115152aa70f312278d05364')

package() {
    install -d $pkgdir/usr/bin
	cd $srcdir
	chmod 755 vegeta
	cp vegeta $pkgdir/usr/bin
}
