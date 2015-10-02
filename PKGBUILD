# Maintainer: Papajoker <papajoker [at] archlinux [dot] info>
pkgname=pacman-diffs
pkgver=1.0.0
pkgrel=0
pkgdesc="finding .pacnew files and compare"
arch=('any')
license=('GPL')
depends=('findutils' 'diffutils')
optdepends=('diffuse: graphical editor[community]'
        'kompare: kde editor [extra]')
source=("pacman-diffs")
md5sums=('SKIP')

package() {
  install -Dm755 ./${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
