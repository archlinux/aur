# Maintainer: Your Name <youremail@domain.com>
pkgname=rana
pkgver=1.0
pkgrel=0
pkgdesc="A better syntax for SGML"
arch=("any")
url="https://github.com/deeepaaa/rana"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("rana.cpp" "helper.h" "makefile")
noextract=()

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  sudo make install
}

md5sums=('dc0207309bec551f42e97ecab4a68af9'
         '0338aafc1549cf8bd7a2f1244bf40a05'
         'fefdd71b67679e5022f412da536392fd')
