pkgname='pacundo'
pkgver='1.1.1'
pkgrel=2
pkgdesc='A time machine to rollback your ArchLinux machine to a working state.'
arch=('any')
url='https://code.ortegas.org/nortega/pacundo'
license=('Zlib')
depends=('perl' 'perl-file-readbackwards' 'curl')
makedepends=('make')
source=("https://code.ortegas.org/nortega/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('4db7ca1e7b58a38e4ffd21818d56dc051e84f4b650c677c0f461455035c28537')

build() {
	cd "$pkgname"
	make doc
}

package() {
	cd "$pkgname"
    PREFIX="$pkgdir/usr" make install
}
