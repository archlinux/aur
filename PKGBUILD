## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=libgmpris
_debpkgver=2.2.1-6_amd64
pkgver=2.2.1
pkgrel=2
pkgdesc=" GMPRIS GDBus bindings
 GDBus bindings generated from the GMPRIS XML spec files."
arch=('x86_64')
url="http://www.sonarnerd.net"
license=('LGPL')
depends=('glibc' 'glib2')
source=("http://www.sonarnerd.net/src/bionic/libgmpris_$_debpkgver.deb")
sha256sums=('5136a357874b4d5fcf022a324c8801ecd95d58f746f274aa8014a2deceb15e6d')

package() {
 cd "$srcdir"
  bsdtar xf data.tar.xz -C "$pkgdir"
}
