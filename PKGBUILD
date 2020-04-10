# Maintainer: Baldur Sigurðsson <baldursigurds@gmail.com>
pkgname=latco
pkgver=0.0
pkgrel=1
pkgdesc="A shared library for computing lattice cohomology"
arch=('any')
url="https://bitbucket.org/baldursigurds/latco"
license=('GPL')
depends=('glibc')
source=(git+https://bitbucket.org/baldursigurds/latco)
md5sums=('SKIP') #autofill using updpkgsums

build() {
  cd latco
  make
}

package() {
  cd latco
  make DESTDIR="$pkgdir"/usr install
}
