# Maintainer: Haris Gušić <harisgusic dot dev at gmail dot com>
pkgname=shdocker
pkgver=0.1.0
pkgrel=1
pkgdesc="Don't repeat your Dockerfiles"
arch=('x86_64')
url="https://github.com/veracioux/$pkgname"
license=('MIT')
depends=('docker')
makedepends=('git')
source=("git+https://github.com/veracioux/$pkgname#tag=v$pkgver")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
	cd "$srcdir/$pkgname"
	make
	make install PREFIX=/usr DESTDIR="$pkgdir"
}
