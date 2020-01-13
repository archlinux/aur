# Maintainer: Stephen Smith <stephen304@gmail.com>
pkgname=chattervox-bin
_pkgname=chattervox
pkgver=0.7.0
pkgrel=1
pkgdesc="An AX.25 packet radio chat protocol with support for digital signatures and binary compression. Like IRC over radio waves."
arch=('i686' 'x86_64')
url="https://github.com/brannondorsey/chattervox"
license=('GPL3')
optdepends=('direwolf')
provides=('chattervox')
conflicts=('chattervox')
source=("https://github.com/brannondorsey/chattervox/releases/download/v0.7.0/chattervox-linux-x64.tar.gz")
sha256sums=('1624c54fd18201c365793fca78d984e645440dc4802b575b3caaf805f1c03c68')
options=('!strip')

package() {
  cd "$srcdir/chattervox-linux-x64"
  install -D -m755 chattervox "$pkgdir/usr/bin/chattervox"
  install -D -m755 serialport.node "$pkgdir/usr/bin/serialport.node"
}
