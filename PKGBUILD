# Maintainer: JKA Network (JoseluCross, Kprkpr, Yukialba) <contacto@jkanetwork.com>
pkgname=gitdit
pkgver=0.2.2
pkgrel=2
pkgdesc="gitdit - Git DIalog inTerface"
arch=('any')
url="http://proyecto.jkanetwork.com"
license=('GPL3')
groups=('jka-toolkit')
options=(!emptydirs)
source=("https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit/gitdit")
md5sums=('4347cf2c7e17ad7d7b7bfa7decf62cfc')

package() {
  install -Dm755 $srcdir/gitdit "${pkgdir}/usr/bin/gitdit"
}
