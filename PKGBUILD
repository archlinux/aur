# Maintainer: aksr <aksr at t-com dot me>
pkgname=libmawk
pkgver=0.10.1
pkgrel=1
epoch=
pkgdesc="A fork of mawk 1.3.3 restructured for embedding."
arch=('i686' 'x86_64')
url="http://repo.hu/projects/libmawk/"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
checkdepends=()
provides=('libmawk')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://repo.hu/projects/libmawk/releases/$pkgname-$pkgver.tar.gz")
noextract=()
options=()
md5sums=('bd89c8dc591e62f09bf6109d0f8cb0f3')
sha1sums=('2d6b9b9bb6398552ab7b1986a6ba1ff96b38c732')
sha256sums=('07c60147130973d78d37039f57f3f4968564442dc8985d13652838497619d0dd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install_root="$pkgdir/" MANDIR="$pkgdir/usr/share/man/man1/" install
}

