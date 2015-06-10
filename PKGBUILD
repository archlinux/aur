# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=diglog
pkgver=5.51
pkgrel=1
pkgdesc="Design and simulate circuits"
arch=('x86_64' 'i686')
url="http://heim.ifi.uio.no/~inf103/Grl/"
license=('unknown')
conflicts=("chipmunksystem")
source=("http://heim.ifi.uio.no/~inf103/Grl/prog/diglog/diglog-5.51-linux-i386-glibc2.tar.gz")
sha256sums=('5e61a8be69febfac15d902a4ce301b2f1edf2c5239ce9089a80e652a6ebabe52')

package() {
  cd "$srcdir"

  install -Dm755 "usr/X11R6/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  mkdir -p "$pkgdir/usr/lib"
  cp -r "usr/lib/chipmunk" "$pkgdir/usr/lib/"
}

# vim:set ts=2 sw=2 et:
