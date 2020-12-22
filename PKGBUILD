#Maintainer: Aditya Suresh ethanaditya@gmail.com
pkgname='ipmap'
pkgver='0.1.6'
pkgrel=1
pkgdesc="An interactive map that shows connected IP addresses. (This is a binary package)"
arch=('x86_64')
url="https://github.com/skylinecc/ipmap"
license=('GPL')
depends=('libpcap')
makedepends=('make')
source=("https://github.com/skylinecc/ipmap/raw/main/packaging/arch/$pkgname-$pkgver.tar.gz")
md5sums=("SKIP")

prepare () {
	cd ../ && pwd && tar -xzf $pkgname-$pkgver.tar.gz
}

package() {
	make DESTDIR="" install
}
