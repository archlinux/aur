# Maintainer: Barazok <barazok.blackrocks@gmail.com>
pkgname=mlv
pkgver=2.0.2
pkgrel=3
pkgdesc="The MLV library is a simplified multimedia library. This library is ideal for students who are new to C programming and want to add graphic and sound effects to their programs."
arch=('any')
url="http://www-igm.univ-mlv.fr/~boussica/mlv/api/French/html/index.html"
license=('GPL')
groups=()
depends=('gcc' 'libtool' 'make' 'autoconf' 'doxygen' 'sdl' 'sdl_gfx' 'sdl_mixer' 'sdl_ttf' 'glib2' 'libxml2' 'sdl_image')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://download.savannah.gnu.org/releases/mlv/mlv-2.0.2/mlv-2.0.2.tar.gz)
noextract=()
md5sums=('1b29b677ea0123f92e4a0486139b57b1')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
