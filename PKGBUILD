# Maintainer: Baldur Sigurðsson <baldursigurds@gmail.com>
pkgname=lattice
pkgver=0.0
pkgrel=1
pkgdesc="An interface to latco, for computing lattice cohomology"
arch=('any')
url="https://bitbucket.org/baldursigurds/lattice"
license=('GPL')
depends=('glibc' 'latco')
source=(git+https://bitbucket.org/baldursigurds/lattice)
md5sums=('SKIP') #autofill using updpkgsums

build() {
  cd lattice
  make
}

package() {
  cd lattice
  make DESTDIR="$pkgdir"/usr install
}
