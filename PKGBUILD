# Maintainer: 100best <jm.100best@hotmail.com>

pkgname=terravox-git
pkgver=0.0.3.git
pkgrel=1
pkgdesc="Simple heightmap Editor for Voxlap5 VXL (512x512 only)"
url="https://github.com/yvt/terravox"
arch=('x86_64' 'i686')
license=('MIT')
makedepends=('git')
depends=('qt5-base' 'luajit')
optdepends=('openspades-git' 'pysnip-git')
source=('git+https://github.com/yvt/terravox.git')
md5sums=('SKIP')

package() {
  cd $srcdir/terravox
  qmake Terravox.pro
  make
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  mv Terravox $pkgdir/usr/bin
}
