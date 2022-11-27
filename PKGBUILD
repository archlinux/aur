# Maintainer: Huck Boles <huboles@protonmail.com>
pkgname=odot
pkgver=0.1.1
pkgrel=4
pkgdesc="Task manager written in c"
arch=('any')
url="https://download.huck.website"
license=('GPL')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::$url/$pkgname-$pkgver.tar.gz")
install=odot.install
sha256sums=('13dd54b3722f5420023bfba2f7e31480a0d6a1f22959d7be9c0fe5511f56aae9')
build() {
    cd "$srcdir"
    gcc main.c -o odot
}
package() {
	cd "$srcdir"
    install -CDm755 odot -T "$pkgdir/usr/bin/odot" 
}
