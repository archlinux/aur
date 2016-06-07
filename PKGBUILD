# Maintainer: Brandon Milton <brandon.milton21@gmail.com>
pkgname=download-sweeper
pkgver=1.0
pkgrel=5
pkgdesc="A stale file archive and removal tool"
arch=('any')
url="https://github.com/brandonio21/download-sweeper"
license=('GPL')
depends=('python>=3' 'systemd' 'python-virtualenv')
makedepends=('python-pip')
source=("https://github.com/brandonio21/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('945c87019d98ac6bd2a04f089bf7189e')

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
