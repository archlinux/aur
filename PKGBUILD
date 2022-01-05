# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Liang Wei <weiliang1503@yandex.com>
# Contributor: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gwm
pkgver=0.9.14
pkgrel=1
pkgdesc="A modern tiling windows manager for X11"
arch=('x86_64' 'aarch64')
url="https://sourceforge.net/projects/gsmwm/"
license=('GPL3')
depends=('bash' 'libx11' 'ctags')
source=("https://sourceforge.net/projects/gsmwm/files/$pkgname-$pkgver.tar.gz")
sha256sums=('3d920481a8d42435c6a56f127840e421c4f22f1dfe60f8d39dc8374bcbb611c7')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make prefix="$pkgdir/usr/" install
}
