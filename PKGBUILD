# Maintainer: aksr <aksr at t-com dot me>
pkgname=newsqueak
pkgver=1
pkgrel=1
epoch=
pkgdesc="A Unix implementation of Newsqueak."
arch=('i686' 'x86_64')
url="http://www.herpolhode.com/rob/"
license=('custom')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.herpolhode.com/rob/$pkgname.tar.gz")
noextract=()
md5sums=('3562d4a1a55cc7984c5b1559155c2322')
sha1sums=('085cc8248be5b6145f57b8517e0f22469e5047c1')
sha256sums=('875552bc8fcca2606b3c617a7bc298ecbb2529d42f28a16ced544b66be98d72f')

build() {
  cd "$srcdir"
  make
}

check() {
  cd "$srcdir"
  make -k check
}

package() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/{bin,share/doc/$pkgname}
  install -Dm 755 $srcdir/squint/squint $pkgdir/usr/bin/squint
  install -Dm 644 $srcdir/doc/language.ps $pkgdir/usr/share/doc/$pknamek/language.ps
  install -Dm 644 $srcdir/doc/implementation.ps $pkgdir/usr/share/doc/$pkgname/implementation.ps
}

