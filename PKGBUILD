# Maintainer: Aditya Saligrama <saligrama427@gmail.com>
pkgname=corels
pkgver=1.0
pkgrel=1
pkgdesc="Certifiably Optimal Rule Lists. C-library to build a certifiably optimal rule list from input data and labels."
arch=('i686' 'x86_64')
url="https://github.com/nlarusstone/corels"
license=('GPL')
groups=()
depends=('gsl' 'gmp')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/margoseltzer/corels-homebrew/files/1441466/corels-1.0.tar.gz")
noextract=()
sha256sums=("013fd81472759a4e8f7ae8dec9ce4a9769286d41cd3ff33c5fc9bfb668a70b7d")

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
