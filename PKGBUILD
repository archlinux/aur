# Maintainer: Md. Jahidul Hamid <jahidulhamid@yahoo.com>
pkgname=pacget
pkgver=1.0.4
pkgrel=1
pkgdesc="A wrapper around pacaur to mimic yaourt's search feature"
arch=('any')
url="https://github.com/neurobin/pacget"
license=('BSD')
depends=('pacaur')
optdepends=('pkgfile: support for package search by file name')
source=("https://github.com/neurobin/$pkgname/archive/$pkgver.tar.gz")
md5sums=('aa0d506e23f937e080ee4a8f7b7320c1')
validpgpkeys=('3331 6137 5B22 27AC F7AA  6351 A4A2 CA5B 6BDA A871')

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
