# Maintainer: aksr <aksr at t-com dot me>
pkgname=llx
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Reads commands from standard input and executes them in parallel."
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir/"
license=('custom:BSD')
groups=()
depends=()
makedepends=()
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("http://litcave.rudi.ir/$pkgname.tar.gz")
noextract=()
options=()
md5sums=('309ebeb8c986e3a74b21f87a25d3d659')
sha1sums=('e3f9477e24c919a80429ffe3ecd093b4a221bfc5')
sha256sums=('66ca85353ac3f2284b432e8e11e1617d1d5ed36bb2b4a26b75212e0c37b5f0db')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 llx "$pkgdir/usr/bin/llx"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}

