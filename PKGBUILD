# Maintainer: Sauyon Lee <sauyon@mari>
pkgname=losslessaudiochecker
pkgver=2.0.5
pkgrel=1
epoch=
pkgdesc=""
arch=('i686' 'x86_64')
url=""
license=('GPL')
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
}

# vim:set ts=2 sw=2 et:
