# Maintainer: aksr <aksr at t-com dot me>
pkgname=shape
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="A farsi/arabic shaping preprocessor for troff."
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir/dir.html"
license=('custom:BSD')
groups=()
depends=('neatroff')
makedepends=()
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://litcave.rudi.ir/$pkgname.tar.gz")
noextract=()
options=()
md5sums=('a880e3c269bf0f30d4f2559d065929f0')
sha1sums=('1b0d305f2f36305fa6e15fd394fd8dfe44016575')
sha256sums=('05b147225c8bdc7e103865c74ff2e5fb34ba9fa819c1c9e651d3772ffd0346aa')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 shape $pkgdir/usr/bin/shape
}

