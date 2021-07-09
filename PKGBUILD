# Contributor: Liang Wei <weiliang1503@yandex.com>
# Contributor: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gwm
pkgver=0.9.3
pkgrel=1
epoch=
pkgdesc="A modern tiling windows manager for X11"
arch=('x86_64' 'aarch64')
url="https://sourceforge.net/projects/gsmwm/"
license=('GPL3')
depends=('bash' 'libx11')
source=("https://sourceforge.net/projects/gsmwm/files/$pkgname-$pkgver.tar.gz")
sha256sums=('8568aee5160ca46aa3ced12d5c1f1402c4d38a94e19eae5600fc7b3349d8631e')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make prefix="$pkgdir/usr/" install
}
