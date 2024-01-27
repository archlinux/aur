# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='dmenufm'
pkgver='2.2'
pkgrel='1'
pkgdesc='A simple file manager using dmenu'
arch=('any')
url="https://github.com/huijunchen9260/$pkgname"
license=('GPL-3.0-only')
depends=('xclip' 'wmctrl' 'unrar' 'cabextract' 'dmenu' 'unzip' 'p7zip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('9e15d3b7559c12883a5f189293e49fd64c1686ea5cea088683c551b890c2672c767938d512f16d14cbd05537cc7b00b24bd7e32093b52a1acf1d71ba24c15f57')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
