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
md5sums=('b23109f3ddafe56e9216a8e18d8ffd6e')

package() {
  cd "${srcdir}"
  install -Dm755 fetchmirrors.sh $pkgdir/usr/bin/fetchmirrors
}

# vim:set ts=2 sw=2 et:
