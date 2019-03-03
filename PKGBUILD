# Maintainer: Justin Vreeland <vreeland.justin@gmail.com>
pkgname=debmake
pkgver=4.3.1
pkgrel=1
pkgdesc="Program to make the Debian source package"
arch=('any')
url="http://packages.debian.org/sid/debmake"
license=('MIT')
makedepends=('git' 'python')
depends=('devscripts' 'dpkg' 'python' 'rsync')
optdepends=('strace' 'wget' 'curl')
source=("$pkgname-$pkgver::git+https://salsa.debian.org/debian/debmake.git#tag=debian/$pkgver-$pkgrel")
md5sums=('SKIP')

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
