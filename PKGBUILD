# Maintainer: JKA Network (JoseluCross, Kprkpr, Yukialba) <contacto@jkanetwork.com>
pkgname=gitdit
pkgver=1.0.4
pkgrel=2
pkgdesc="gitdit - Git DIalog inTerface"
arch=('any')
url="http://proyecto.jkanetwork.com"
license=('GPL3')
groups=('jka-toolkit')
options=(!emptydirs)
source=("https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit/gitdit")
md5sums=('1c8e0dfc4f3702db0cb6443a46eb1c50')

package() {
  install -Dm755 $srcdir/gitdit "${pkgdir}/usr/bin/gitdit"
}
