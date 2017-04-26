# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=sigviewer
pkgver=0.6.1
pkgrel=1
pkgdesc="A viewing application for biosignals"
arch=('i686' 'x86_64')
url="https://github.com/cbrnr/sigviewer"
license=('GPL')
groups=()
depends=('qt5-base' 'libbiosig' 'libxdf')
makedepends=('')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/cbrnr/sigviewer/archive/v$pkgver.zip)
noextract=()
sha1sums=('264f3d01da215c7493a566509f05eb7f25e56ee0')

build() {
  cd "$srcdir/sigviewer-$pkgver"
  qmake
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/sigviewer-$pkgver/bin/release/sigviewer" "$pkgdir/usr/bin"
}
