# Maintainer:  Zachary Lund <admin@computerquip.com>

pkgname=llnextgen
pkgver=0.5.5
pkgrel=1
pkgdesc="The spirtual successor of Jacobs and Grune's parser generator."
arch=('i686' 'x86_64')
url="os.ghalkes.nl/LLnextgen/download.html"
license=('GPL3')
makedepends=()
depends=()
conflicts=()
source=("http://os.ghalkes.nl/LLnextgen/releases/LLnextgen-$pkgver.tgz")
md5sums=('f3733cca58f862d41b8fb3d9e20b8426')

build() {
  cd "$srcdir/LLnextgen-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/LLnextgen-$pkgver"

  make prefix="$pkgdir/usr/" install
}