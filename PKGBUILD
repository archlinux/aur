# Maintainer: Benjamin Jones <benjaminjones314+aur@gmail.com>
pkgname=rubiks_cube
pkgver=1.1
pkgrel=1
pkgdesc="A rubiks cube that runs in the terminal"
url="https://github.com/been-jamming/rubiks_cube"
license=('MIT')
depends=('ncurses')
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
source=("https://sourceforge.net/projects/terminal-rubiks-cube/files/$pkgname-$pkgver.tar.gz")
md5sums=('5c9491e84d007282752f2c188649f137')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" install
}
