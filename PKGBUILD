# Maintainer: Erdal Mutlu <erdal at sisiya dot org>
pkgname=sisiya-webui-images
pkgver=0.6.31
pkgrel=1
epoch=
pkgdesc="The SisIYA daemon."
arch=('any')
url="http://www.sisiya.org"
license=('GPL2')
groups=()
depends=()
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
#source=("$pkgname-$pkgver.tar.gz")
source=("http://sourceforge.net/projects/sisiya/files/sisiya/$pkgver/pacman/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('11d25daa094a3451d8577aa2faab8276') #generate with 'makepkg -g'

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make "DESTDIR=$pkgdir" install
}
