# Maintainer: bjoern kessler <thefutarist@gmail.com
pkgname=laborejo
pkgver=2.0.0
pkgrel=1
epoch=
pkgdesc="A MIDI sequencer based on classical music notation."
arch=('x86_64')
url="https://laborejo.org/"
license=('GPL')
groups=()
depends=('glibc' 'python' 'python-pyqt5' 'ttf-dejavu' 'lilypond')
makedepends=('bash' 'nuitka' 'gcc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://www.laborejo.org/downloads/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=()
validpgpkeys=()

#prepare() {
#	#cd "$pkgname-$pkgver"
#	#patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
md5sums=('1a9e32f80e33871f10884e6bb4567d1a')
