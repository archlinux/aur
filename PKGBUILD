# Maintainer: Papajoker <papajoker [at] archlinux [dot] info>
pkgname=pacman-diffs
pkgver=1.1.0
pkgrel=0
pkgdesc="finding .pacnew files and compare, and archive"
arch=('any')
license=('GPL')
depends=('findutils' 'diffutils')
optdepends=('diffuse: graphical editor[community]'
        'kompare: kde editor [extra]'
        'gksu: gnome gui for su'
        'kde-cli-tools: kde gui for su')
source=("pacman-diffs")
md5sums=('SKIP')

package() {
  install -Dm755 ./${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -dm755 ${pkgdir}/var/cache/pacman/pacnew/
}
