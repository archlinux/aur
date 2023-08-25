# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=yadp
pkgname=$_pkgname-git
pkgver=0.0.0
pkgrel=2
pkgdesc='Yet Another xDelta Patcher'
arch=('any')
url='https://github.com/Nhoya/YADP'
license=('GPL3')
depends=('xdelta3')
makedepends=('git')
conflicts=($_pkgname)
provides=($_pkgname)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd YADP
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 YADP/YADP "$pkgdir/usr/bin/$_pkgname"
}
