# Maintainer: Arsen Musayelyan <moussaelianarsen@gmail.com>
pkgname=pak
pkgver=1.0
pkgrel=3
pkgdesc="A package manager wrapper written in swift designed to unify different package managers"
arch=('x86_64')
url="https://gitlab.com/moussaelianarsen/pak"
license=('GPL3')
depends=('pak-config')
provides=('pak')
source=("https://gitlab.com/moussaelianarsen/pak/-/archive/master/pak-master.tar.gz")
md5sums=('SKIP')
replaces=('pak-yay' 'pak-pacman')

build() {
	cd "pak-master"
	make
}

package() {
	cd "pak-master"
	install -Dm755 pak $pkgdir/usr/bin/pak
}
