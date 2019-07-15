# Maintainer: Arsen Musayelyan <moussaelianarsen@gmail.com>
pkgname=pak-yay
pkgver=1.5
pkgrel=3
pkgdesc="A package manager wrapper for yay written in swift"
arch=('x86_64')
url="https://gitlab.com/moussaelianarsen/pak"
license=('GPL3')
depends=('swift-language' 'yay')
provides=('pak' 'yaywrap')
source=("https://gitlab.com/moussaelianarsen/pak/-/archive/master/pak-master.tar.gz")
md5sums=('SKIP')
conflicts=('pak-pacman')
install="pak-yay.install"

build() {
	cd "pak-master"
	make yaywrap
}

package() {
	cd "pak-master"
	sudo make yayinstall
}
