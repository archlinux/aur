# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='dmenufm'
pkgver='1.2'
pkgrel='1'
pkgdesc='A simple file manager using dmenu'
arch=('any')
url="https://github.com/huijunchen9260/$pkgname"
license=('GPL3')
depends=('xclip' 'wmctrl' 'unrar' 'cabextract' 'dmenu' 'unzip' 'p7zip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('448c94d0238a82abe303dad15fab4a64e9871071e0870010d7c0f1a3f462d352')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
