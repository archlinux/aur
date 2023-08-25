# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=yadp
pkgname=$_pkgname-git
pkgver=0.0.0
pkgrel=1
pkgdesc='Yet Another xDelta Patcher'
arch=('any')
url='https://github.com/Nhoya/YADP'
license=('GPL3')
depends=('xdelta3')
source=("https://raw.githubusercontent.com/Nhoya/YADP/master/YADP")
sha256sums=('SKIP')

package() {
  install -Dm755 YADP "$pkgdir/usr/bin/$_pkgname"
}
