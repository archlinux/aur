# Contributor: Liang Wei <weiliang1503@yandex.com>
# Contributor: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gwm
pkgver=0.9.12
pkgrel=1
pkgdesc="A modern tiling windows manager for X11"
arch=('x86_64' 'aarch64')
url="https://sourceforge.net/projects/gsmwm/"
license=('GPL3')
depends=('bash' 'libx11' 'ctags')
source=("https://sourceforge.net/projects/gsmwm/files/$pkgname-$pkgver.tar.gz")
sha256sums=('fbb61846f9e584ba21e20b62fba3079d86b615e5d1f57854f72235cd6597be91')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make prefix="$pkgdir/usr/" install
}
