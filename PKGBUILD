# Maintainer: willemw <willemw12@gmail.com>

_pkgname=castero
pkgname=$_pkgname-git
pkgver=0.2.3.r12.g9d7edb3
pkgrel=1
pkgdesc="Podcast client for the command line"
arch=('any')
url="https://xgi.github.io/castero"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
#backup=('...')
source=($pkgname::git+https://github.com/xgi/castero.git)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $pkgname
  echo TODO
}

