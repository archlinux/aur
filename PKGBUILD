# $Id$
# Maintainer: Haruyuki lxz <lxz@ilxz.me>

pkgname=deepin-nvidia-prime-git
pkgver=0.0.0.r1.0e1e70e
pkgrel=1
pkgdesc='nvidia prime for deepin'
arch=('x86_64')
url="https://github.com/linuxdeepin/nvidia-prime"
license=('GPL3')
options=('debug')
source=("git+https://github.com/linuxdeepin/nvidia-prime.git")
sha512sums=('SKIP')

package() {
  cd nvidia-prime
  git checkout 0e1e70e
  cp -r sbin $pkgdir/
  cp -r usr $pkgdir/
}
