#Maintainer: Bartłomiej Szostak <kapcioszek2137@gmail.com>
pkgname=fremen-transcriptor-bin
pkgver=1.1
pkgrel=1
pkgdesc="Software to transcript ASCII into desert people's writing from popular sci-fi franchise"
arch=('x86_64')
url="https://github.com/theKapcioszek/fremen-transcriptor"
license=('GPL3')
depends=()
makedepends=()
optdepends=()
provides=('fremen-transcriptor')
conflicts=('fremen-transcriptor')
backup=()
install=
source=("https://github.com/theKapcioszek/fremen-transcriptor/releases/download/1.1/fremen-transcriptor-1.1_linux-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
  cd "fremen-transcriptor-1.1_linux-x86_64"
  mkdir $pkgdir/opt
  mkdir $pkgdir/usr/
  mkdir $pkgdir/usr/bin
  cp -r fremen-assets/ $pkgdir/opt
  cp fremen-transcriptor $pkgdir/opt
  ln -s $pkgdir/opt/fremen-transcriptor $pkgdir/usr/bin/fremen-transcriptor
}
