pkgname=qnetwalk
pkgver=1.5
pkgrel=1
pkgdesc="Connect all the terminals to the server, in as few turns as possible"
arch=('x86_64')
url="https://github.com/AMDmi3/qnetwalk"
license=('GPL')
depends=('qt5-base' 'sdl_mixer')
makedepends=('cmake')
source=("https://github.com/AMDmi3/qnetwalk/archive/$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

md5sums=('5ca63903243d4ffdf77fa972c01581d3')
sha1sums=('b31aa30000b368bcc7dacf0a29ab568eed04b048')
sha256sums=('69394a8007fd59c3117c72dedbee76620f3324045a1687ed384616a0b3b22bcb')
sha384sums=('5c3509529bd9fe9e5fd6d8b3dfbeb4fc140408307680eb7d86ec36476c2c0826683202ef18afe377746e4c6f806d6708')
sha512sums=('f58d25033b515ee79e73d6f9528908818ee510083ba378c42481cb2fafe3eb041bf43425eaa335b6bfaeee959815916343fba77431aacf30b9ebdca9ac78735e')
