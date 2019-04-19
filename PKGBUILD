# Maintainer: Peter Semiletov peter.semiletov at gmail dot com
# Packager: Peter Semiletov 

pkgname=fuse-emulator-utils
pkgver=1.4.3
pkgrel=1
pkgdesc="ZX Spectrum emulator utils"
arch=('i686' 'x86_64')
url="http://fuse-emulator.sourceforge.net/fuse.php"
license=("GPL")
depends=('gtk3' "libspectrum>1.4.3" 'sdl')
source=("https://sourceforge.net/projects/fuse-emulator/files/fuse-utils/$pkgver/fuse-utils-$pkgver.tar.gz")

build() {
 cd "fuse-utils-$pkgver"
 ./configure --prefix=/usr
 make
}

package() {
 cd "fuse-utils-$pkgver"
 make DESTDIR="$pkgdir" install
}

md5sums=('b1cbe93b174e83f0c8fac004d328ea70')