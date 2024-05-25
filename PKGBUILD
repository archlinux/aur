pkgname='pacundo'
pkgver='1.1'
pkgrel=2
pkgdesc='A time machine to rollback your ArchLinux machine to a working state.'
arch=('any')
url='https://code.ortegas.org/nortega/pacundo'
license=('Zlib')
depends=('perl' 'perl-file-readbackwards' 'curl')
makedepends=('make')
source=("https://code.ortegas.org/nortega/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('58898bfdc9ed75fd8fbf4072906e086cd0e9d5b33014be631d9cadc684487e71')

build() {
	cd "$pkgname"
	make doc
}

package() {
	cd "$pkgname"
    PREFIX="$pkgdir/usr" make install
}
