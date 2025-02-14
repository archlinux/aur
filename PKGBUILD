# Maintainer: baboon

pkgname="libplib-bin"
pkgver=1.8.5
pkgrel=1
pkgdesc="Provides a Joystick interface, a simple GUI built on top of OpenGL, some standard geometry functions, a sound library and a simple scene graph API built on top of OpenGL. "
arch=('x86_64')
url="https://plib.sourceforge.net/"
license=('LGPL')
depends=(
freeglut
glibc
gcc-libs
libglvnd
libice
libsm
libstdc++5
libx11
libxext
libxi
libxmu)
conflicts=('plib')
provides=('plib')
source=("http://ftp.ca.debian.org/debian/pool/main/p/plib/libplib1_1.8.5-14+b1_amd64.deb")
sha512sums=('SKIP')
options=('!strip')

package() {
  cd $pkgdir
  tar xf $srcdir/data.tar.xz
  mv $pkgdir/usr/lib/x86_64-linux-gnu/* $pkgdir/usr/lib/
  rmdir $pkgdir/usr/lib/x86_64-linux-gnu 
}
