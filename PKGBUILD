# Maintainer: Brandon Milton <brandon.milton21@gmail.com>
pkgname=download-sweeper
pkgver=1.0
pkgrel=2
pkgdesc="A stale file archive and removal tool"
arch=('any')
url="https://github.com/brandonio21/download-sweeper"
license=('GPL')
depends=('python>=3' 'systemd')
makedepends=('python-pip')
source=("https://github.com/brandonio21/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('bf101f6c999535a719cdd3cda2691ad8')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
