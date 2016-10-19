# Maintainer: Adrian Wheeldon <arandomowl at gmail dot com>
pkgname=workcraft
pkgver=3.1.2
pkgrel=1
pkgdesc="A framework for interpreted graph models including petri nets and STGs"
arch=('i686' 'x86_64')
url="http://www.workcraft.org/"
license=('GPL')
depends=('java-runtime')
optdepends=('graphviz: Graph manipulation')
provides=('workcraft')
conflicts=('workcraft')
source=(http://www.workcraft.org/_media/download/workcraft-v3.1.2-linux.tar.gz workcraft_start.sh)
package() {
  cd $srcdir
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/opt/workcraft
  cp -RP workcraft/* "$pkgdir"/opt/workcraft/
  cp workcraft_start.sh "$pkgdir"/usr/bin/workcraft
  chmod 755 "$pkgdir/usr/bin/workcraft"
}
md5sums=('b17582f4568d0b9e79c5c7808ed9d492' '48f63dfedeeaac4dd8ccde2d2822fefc')
