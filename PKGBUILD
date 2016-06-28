# Maintainer: JKA Network (JoseluCross, Kprkpr, Yukialba) <contacto@jkanetwork.com>
pkgname=gitdit
pkgver=0.2.0
pkgrel=1
pkgdesc="gitdit - Git DIalog inTerface"
arch=('any')
url="http://proyecto.jkanetwork.com"
license=('GPL3')
groups=('jka-toolkit')
options=(!emptydirs)
source=("https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit/gitdit")
md5sums=('a6f7b8fc2a951c7b960a9c1fcbc92489')

package() {
  install -Dm755 $srcdir/gitdit "${pkgdir}/usr/bin/gitdit"
}
