# Maintainer: KoNicks <konicksdev@gmail.com>
pkgname=koffe
pkgver=1.3.5
pkgrel=1
epoch=
pkgdesc="simple tool for creating easy to use and offline-friendly arch installers with aur support"
arch=('any')
url="https://github.com/konickss/koffe"
license=('GPL')
groups=()
depends=(bash archiso pacman-contrib libnewt wget git)
makedepends=(tar)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('koffe' 'pi.is' 'install')
noextract=()
md5sums=('SKIP' 'SKIP' 'SKIP')
validpgpkeys=()

package() {
	mkdir $pkgdir/usr/
	mkdir $pkgdir/usr/bin/
	mkdir $pkgdir/usr/share/
	cp $srcdir/koffe $pkgdir/usr/bin/
	mkdir $pkgdir/usr/share/koffe/
	cp $srcdir/install $pkgdir/usr/share/koffe/
	cp $srcdir/pi.is $pkgdir/usr/share/koffe/
}
