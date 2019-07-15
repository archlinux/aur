# Maintainer: Arsen Musayelyan <moussaelianarsen@gmail.com>
pkgname=pak-pacman
pkgver=1.5
pkgrel=3
pkgdesc="A package manager wrapper for pacman written in swift"
arch=('x86_64')
url="https://gitlab.com/moussaelianarsen/pak"
license=('GPL3')
depends=('swift-language' 'pacman')
provides=('pak' 'pacwrap')
source=("https://gitlab.com/moussaelianarsen/pak/-/archive/master/pak-master.tar.gz")
md5sums=('SKIP')
conflicts=('pak-yay')
install="pak-pacman.install"

build() {
	cd "pak-master"
	make pacwrap
}

package() {
	cd "pak-master"
	sudo make pacinstall
}
