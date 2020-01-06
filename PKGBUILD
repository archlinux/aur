# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='dmenufm'
pkgver='1.1'
pkgrel='2'
pkgdesc='A simple file manager using dmenu'
arch=('any')
url="https://github.com/huijunchen9260/$pkgname"
license=('unknown')
depends=('xclip' 'wmctrl' 'unrar' 'cabextract' 'dmenu' 'unzip' 'p7zip')
makedepends=('make')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9a10a0ba22541badb02d35473958c9fddbf700706170294f763b1f04b1cdc49a')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
