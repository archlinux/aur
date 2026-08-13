# Maintainer: Peter Semiletov peter.semiletov at gmail dot com
# Packager: Peter Semiletov 

pkgname=fuse-emulator-utils
pkgver=1.4.6
pkgrel=5
pkgdesc="ZX Spectrum emulator utils"
arch=('i686' 'x86_64')
url="http://fuse-emulator.sourceforge.net/fuse.php"
license=("GPL")
depends=('gtk3' "libspectrum>=1.6.2" 'sdl')
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

md5sums=('c944806dc8b7e638e99bb53540865286')
