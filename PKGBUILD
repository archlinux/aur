# Maintainer: Andrei Apps <andreiacatrini712@gmail.com>
pkgname=guessthenumber
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="A game in which you have to guess a number from 1 to 10"
arch=(any)
url="https://andreiapps.com"
license=('GPL')
groups=()
depends=('jre17-openjdk')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://andreiapps.com/downloads/GuessTheNumber/v1.0/archlinux/$pkgname-$pkgver.tar.gz")
sha256sums=("cdaede047a53e86aedcdda2a0240a64affc963f65db364e41238aac1c5b9ace1")
noextract=()
validpgpkeys=()

package() {
	cd $srcdir
    mkdir -p $pkgdir/usr/share/java/guessthenumber
    mkdir -p $pkgdir/usr/bin
    cp guessthenumber.jar $pkgdir/usr/share/java/guessthenumber/
    cp guessthenumber $pkgdir/usr/bin/
}
