# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='dmenufm'
pkgver='2.0'
pkgrel='1'
pkgdesc='A simple file manager using dmenu'
arch=('any')
url="https://github.com/huijunchen9260/$pkgname"
license=('GPL3')
depends=('xclip' 'wmctrl' 'unrar' 'cabextract' 'dmenu' 'unzip' 'p7zip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('efb97270b4d07a5f23dc185aea28a110b33af6f76eefbd89b8b46e4561f67a91')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
