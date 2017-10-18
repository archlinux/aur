# Maintainer: Kiernan Hager <kiernan.hager@gmail.com>
pkgname=fontopia
pkgver=1.7
pkgrel=1
pkgdesc="Text-based vt font editor"
arch=("x86_64" "i686")
url="https://www.gnu.org/software/fontopia/"
license=('GPL')
groups=()
depends=()
makedepends=("gnudos" "texinfo")
optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
changelog=ChangeLog
source=("ftp://ftp.gnu.org/gnu/fontopia/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('4afff2ab0330679e018fa08deea1b2d4')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
