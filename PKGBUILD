# Maintainer: M0Rf30

pkgname=exquisite
pkgver=1.0.0
pkgrel=1
pkgdesc="Bootsplash program able to render in Framebuffer, or X11 (Enlightenmen17 component)"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('efl')
optdepends=()
source=("http://download.enlightenment.org/releases/$pkgname-$pkgver.tar.bz2")

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr

  make
}

package(){
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install


}

md5sums=('5d939d267d97230f0f772b17938ad2ab')
