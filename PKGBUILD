# Maintainer: Brandon Milton <brandon.milton21@gmail.com>
pkgname=download-sweeper
pkgver=1.0
pkgrel=4
pkgdesc="A stale file archive and removal tool"
arch=('any')
url="https://github.com/brandonio21/download-sweeper"
license=('GPL')
depends=('python>=3' 'systemd' 'python-virtualenv')
makedepends=('python-pip')
source=("https://github.com/brandonio21/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('9e55818c68a82a8eff8d40809cf6816f')

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
