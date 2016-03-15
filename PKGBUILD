# Maintainer: deadhead <deadhead3492@gmail.com>
pkgname=fetchmirrors
pkgver=0.3
pkgrel=1
pkgdesc="Fetch and rank new pacman mirrorlist"
arch=('any')
url="https://github.com/deadhead420/fetchmirrors"
license=('GPL')
depends=(
  'bash'
  'curl'
)
optdepends=(
  'wget: fetches new mirrorlist - curl alternate requires one or the other'
)
source=('https://raw.githubusercontent.com/deadhead420/fetchmirrors/master/fetchmirrors.sh')
md5sums=('17935f1f5d703c42ab3dc7f4c18d9c5e')

package() {
  cd "${srcdir}"
  install -Dm755 fetchmirrors.sh $pkgdir/usr/bin/fetchmirrors
}

# vim:set ts=2 sw=2 et:
