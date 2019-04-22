# Maintainer: Sauyon Lee <sauyon@mari>
pkgname=losslessaudiochecker
pkgver=2.0.5
pkgrel=2
epoch=
pkgdesc="A utility to check whether a WAVE or FLAC file is truly lossless or not."
arch=('i686' 'x86_64')
url="http://losslessaudiochecker.com/"
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
source=("http://losslessaudiochecker.com/dl/LAC-Linux-64bit.tar.gz")
md5sums=('85f1925ffa24b963549a8bb7049b75e5')



noextract=()

package() {
  cd "$srcdir/"

  install -Dm755 LAC "$pkgdir/usr/bin/LAC"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
