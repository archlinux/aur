# Maintainer: aksr <aksr at t-com dot me>
pkgname=bib2ref
pkgver=0.1
pkgrel=2
epoch=
pkgdesc="Create refer databases from bibtex files."
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir/"
license=('custom:BSD')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=('texlive-bin' 'neatrefer')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://litcave.rudi.ir/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('55f088593061826bf4473adc16b61cdc')
sha1sums=('87bd52117ba8068a034125f3684b734e512b3f32')
sha256sums=('7f352c24c707f710d08ab85c99e05b8488e5f43eed6b45c2a454c184db63d587')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bib2ref $pkgdir/usr/bin/bib2ref
  install -Dm755 conv.sh $pkgdir/usr/share/$pkgname/conv.sh
}

