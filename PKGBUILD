pkgname=mup
pkgver=6.5
pkgrel=1
pkgdesc="Mup music typesetting"
arch=('x86_64')
url=""
license=('GPL')
groups=()
depends=('fltk')
makedepends=('gcc')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
#install=
changelog=
source=('ftp://ftp.arkkra.com/pub/unix/mup65src.tar.gz')
noextract=()
md5sums=('ea79b26a00e0d9ef0924166429aa5a32') 

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

