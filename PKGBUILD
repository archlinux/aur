# Maintainer: Alan Lutter (alan.lutter@outlook.sk)
pkgrel=0
pkgname=cctools-strip
pkgdesc="cctools' strip"
pkgver=949.0.1_3
arch=('x86_64')
url="http://assets.checkra.in/debian"
license=('unknown')
depends=('base-devel')
makedepends=('wget')
source=('http://assets.checkra.in/debian/cctools-strip_949.0.1-2_amd64.deb')
sha256sums=('8d0e99921de851faefcb1fc867ada0a2348605f3f279e24131b5a424df9fa700')
package(){
  wget -q -O cctools-strip_949.0.1-2_amd64.deb "$url/cctools-strip_949.0.1-2_amd64.deb"
  ar x cctools-strip_949.0.1-2_amd64.deb
  tar -xf data.tar.xz
  sudo cp -r usr/ /
}
