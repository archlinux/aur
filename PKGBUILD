pkgname='pacundo'
pkgver='1.1.1'
pkgrel=1
pkgdesc='A time machine to rollback your ArchLinux machine to a working state.'
arch=('any')
url='https://code.ortegas.org/nortega/pacundo'
license=('Zlib')
depends=('perl' 'perl-file-readbackwards' 'curl')
makedepends=('make')
source=("https://code.ortegas.org/nortega/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('50b7b0557d8dc86f8164025a0150921a8380e7710671b21d7530dfb445a34e91')

build() {
	cd "$pkgname"
	make doc
}

package() {
	cd "$pkgname"
    PREFIX="$pkgdir/usr" make install
}
