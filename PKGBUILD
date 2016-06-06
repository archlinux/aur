# Maintainer: Brandon Milton <brandon.milton21@gmail.com>
pkgname=download-sweeper
pkgver=1.0
pkgrel=1
pkgdesc="A stale file archive and removal tool"
arch=('any')
url="https://github.com/brandonio21/download-sweeper"
license=('GPL')
depends=('python>=3' 'systemd')
makedepends=('python-pip')
source=("https://github.com/brandonio21/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('110606cc97b00bb407831f40c03193d7')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
