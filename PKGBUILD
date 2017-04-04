# Maintainer: Andreas Linz <alinz@klingt.net>

pkgname=vegeta
pkgver=6.3.0
pkgrel=1
pkgdesc='a versatile HTTP load testing tool'
arch=('x86_64')
url='https://github.com/tsenart/vegeta/releases'
license=('MIT')
depends=()
makedepends=()
optsdepends=()
source=("https://github.com/tsenart/vegeta/releases/download/v$pkgver/$pkgname-v$pkgver-linux-amd64.tar.gz")
md5sums=('a70411865b6bf91bf87a7a09d4ce220d')

package() {
    install -d $pkgdir/usr/bin
	cd $srcdir
	chmod 755 vegeta
	cp vegeta $pkgdir/usr/bin
}
