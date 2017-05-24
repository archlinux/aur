# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=edfbrowser
pkgver=1.59
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
source=(http://www.teuniz.net/edfbrowser/edfbrowser_159_source.tar.gz)
noextract=()
sha1sums=('5ee46da284896af5d45a1f60a32921f4e3e8d5ca')

build() {
  cd "$srcdir/edfbrowser_159_source"
  qmake-qt4
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/edfbrowser_159_source/edfbrowser" "$pkgdir/usr/bin"
}
