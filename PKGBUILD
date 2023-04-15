# Maintainer: KoNicks <konicksdev@gmail.com>
pkgname=koffe
pkgver=1.3.8
pkgrel=1
epoch=
pkgdesc="simple tool for creating easy to use and offline-friendly arch installers with aur support"
arch=('any')
url="https://github.com/konickss/koffe"
license=('GPL')
groups=()
depends=(bash archiso pacman-contrib libnewt wget git)
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://github.com/konickss/koffe.git')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
	cd koffe
	mkdir $pkgdir/usr/
	mkdir $pkgdir/usr/bin/
	mkdir $pkgdir/usr/share/
	cp koffe $pkgdir/usr/bin/
	mkdir $pkgdir/usr/share/koffe/
	cp install $pkgdir/usr/share/koffe/
	cp pi.is $pkgdir/usr/share/koffe/
}
