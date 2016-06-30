# Maintainer: JKA Network (JoseluCross, Kprkpr, Yukialba) <contacto@jkanetwork.com>
pkgname=gitdit
pkgver=1.0.0
pkgrel=1
pkgdesc="gitdit - Git DIalog inTerface"
arch=('any')
url="http://proyecto.jkanetwork.com"
license=('GPL3')
groups=('jka-toolkit')
options=(!emptydirs)
source=("https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit/gitdit")
md5sums=('3949b686dc6a5732faa66d30b59f1f71')

package() {
  install -Dm755 $srcdir/gitdit "${pkgdir}/usr/bin/gitdit"
}
