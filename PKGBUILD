# Maintainer: deadhead <deadhead3492@gmail.com>
pkgname=fetchmirrors
pkgver=0.5
pkgrel=1
pkgdesc="Fetch and rank new pacman mirrorlist"
arch=('any')
url="https://github.com/deadhead420/fetchmirrors"
license=('GPL')
depends=('curl')
source=('https://raw.githubusercontent.com/deadhead420/fetchmirrors/master/fetchmirrors.sh')
md5sums=('7f4d188101bc0d2cfa5ac9931e6c9fe3')

package() {
  cd "${srcdir}"
  install -Dm755 fetchmirrors.sh $pkgdir/usr/bin/fetchmirrors
}

# vim:set ts=2 sw=2 et:
