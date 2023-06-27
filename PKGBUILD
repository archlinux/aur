# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Liang Wei <weiliang1503@yandex.com>
# Contributor: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gwm
pkgver=2.4.1
pkgrel=1
pkgdesc="A modern tiling windows manager for X11"
arch=('x86_64' 'aarch64')
url="https://sourceforge.net/projects/gsmwm/"
license=('GPL3')
depends=('bash' 'freetype2' 'libx11' 'ctags')
source=("https://sourceforge.net/projects/gsmwm/files/$pkgname-$pkgver.tar.gz")
sha256sums=('7891d213d056539eb69fdff902b23bc915b295755c5a550235231ff7b4ba112c')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make prefix="$pkgdir/usr/" install
}
