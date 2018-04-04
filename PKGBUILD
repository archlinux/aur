# Maintainer: Josh Marshall <jrmarsha@mtu.edu>

pkgname=pftools
pkgver='2.3'
pkgrel=1
pkgdesc="Contains all the software necessary to build protein and DNA generalized profiles and use them to scan and align sequences, and search databases."
arch=('x86_64')
license=('GPL')
url='https://web.expasy.org/pftools'
depends=('glibc' 'bash')
makedepends=('gcc-libs')
provides=()
path='/coils'
source=(
	"pftools.tar.xz"
)
sha512sums=(
'SKIP'
)


build() {
  cd "$pkgname"
  make all
}

package() {  
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
