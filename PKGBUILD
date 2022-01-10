# Maintainer: James Hendrie <hendrie.james@gmail.com>
pkgname=muzz
pkgver=1.01
pkgrel=2
epoch=
pkgdesc="Calculates muzzle energy given a mass and a velocity (or does the reverse)"
arch=('i686' 'x86_64')
url="https://github.com/jahendrie/muzz"
license=('zlib')
groups=()
depends_x86_64=('glibc')
depends_i686=('lib32-glibc')
makedepends=('gcc' 'make')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/jahendrie/muzz/releases/download/v1.01/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('b29c807f095772ca9e42caa2e6efa1a9')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	#./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
    echo "$pkgdir"
    make PREFIX="$pkgdir/usr" install
	#make DESTDIR="$pkgdir/" install
}
