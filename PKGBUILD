# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=edfbrowser
pkgver=1.60
pkgrel=1
pkgdesc="A free, opensource, multiplatform, universal viewer and toolbox intended for, but
not limited to, timeseries storage files like EEG, EMG, ECG, BioImpedance, etc."
arch=('i686' 'x86_64')
url="http://www.teuniz.net/edfbrowser/"
license=('GPL')
groups=()
depends=('qt4')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://www.teuniz.net/edfbrowser/edfbrowser_160_source.tar.gz)
noextract=()
sha1sums=('a1be8a0ba1e6582e1307611b67cee5988a7e2673')

build() {
  cd "$srcdir/edfbrowser_160_source"
  qmake-qt4
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/edfbrowser_160_source/edfbrowser" "$pkgdir/usr/bin"
}
