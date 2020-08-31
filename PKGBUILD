# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='salvador'
pkgver='0.1.1'
pkgrel='1'
pkgdesc='A simple bash script that will help you manage your AUR packages'
arch=('any')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL3')
depends=('git' 'pacman-contrib' 'perl')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0047aa8ce911b878b580a69a6d3fcfac0e40965768d9d932947cb4cda429a3d4')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
