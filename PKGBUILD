## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=libgmpris
_debpkgver=2.2.1-4_amd64
pkgver=2.2.1
pkgrel=1
pkgdesc=" GMPRIS GDBus bindings
 GDBus bindings generated from the GMPRIS XML spec files."
arch=('x86_64')
url="http://www.sonarnerd.net"
license=('LGPL')
depends=('glibc' 'glib2')
source=("http://www.sonarnerd.net/src/trusty/libgmpris_$_debpkgver.deb")
sha256sums=('1d71aa7d756fcb76c6ad164fc9e92f216f4492fb88bfb2fb00fe74384b02334c')

package() {
 cd "$srcdir"
  bsdtar xf data.tar.xz -C "$pkgdir"
}