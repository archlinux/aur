# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='dmenufm'
pkgver='1.3'
pkgrel='1'
pkgdesc='A simple file manager using dmenu'
arch=('any')
url="https://github.com/huijunchen9260/$pkgname"
license=('GPL3')
depends=('xclip' 'wmctrl' 'unrar' 'cabextract' 'dmenu' 'unzip' 'p7zip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f782cd8cc80b79556fada048b33ad702aa837b8f8497bcc37d22af5f5ceab754')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
