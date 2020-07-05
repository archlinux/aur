# Maintainer: Benjamin Jones <benjaminjones314+aur@gmail.com>
pkgname=rubiks_cube
pkgver=1.2
pkgrel=1
pkgdesc="A rubiks cube that runs in the terminal"
url="https://github.com/been-jamming/rubiks_cube"
license=('MIT')
depends=('ncurses')
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
source=("https://sourceforge.net/projects/terminal-rubiks-cube/files/$pkgname-$pkgver.tar.gz")
md5sums=('46a5c5a108e9bec029161f6af25ec319')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" install
}
