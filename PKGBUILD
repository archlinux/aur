# Maintainer: deadhead <deadhead3492@gmail.com>
pkgname=fetchmirrors
pkgver=0.4
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
md5sums=('c0f8c486330fe3607c17d1279ca203a1')

package() {
  cd "${srcdir}"
  install -Dm755 fetchmirrors.sh $pkgdir/usr/bin/fetchmirrors
}

# vim:set ts=2 sw=2 et:
