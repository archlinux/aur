# Maintainer: aksr <aksr at t-com dot me>
pkgname=ref2bib
pkgver=0.1
pkgrel=2
epoch=
pkgdesc="Convert refer databases to bibtex files."
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
md5sums=('e9341ce75c0f9aa3ca6f11166879d367')
sha1sums=('86c6bc900c4899dfdc692d923adb673e7d336670')
sha256sums=('143495f1afe80dba38612e44cca86bfaae177e95b2bc11d0ebd2af9036ea6e81')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 ref2bib $pkgdir/usr/bin/ref2bib
  install -Dm755 conv.sh $pkgdir/usr/share/$pkgname/conv.sh
}

