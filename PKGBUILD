# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='dmenufm'
pkgver='2.1'
pkgrel='1'
pkgdesc='A simple file manager using dmenu'
arch=('any')
url="https://github.com/huijunchen9260/$pkgname"
license=('GPL3')
depends=('xclip' 'wmctrl' 'unrar' 'cabextract' 'dmenu' 'unzip' 'p7zip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4d2e9ebb7523a195d7a2286b6e42d04c1b0f5fb65db228f33e3347a1be4efbb7')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
