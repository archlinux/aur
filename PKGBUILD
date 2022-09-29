# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: n0vember <n0vember at half-9 dot net>

pkgname=bash_unit
pkgver=2.0.1
pkgrel=1
pkgdesc="bash unit testing enterprise edition framework for professionals"
arch=('any')
url="https://github.com/pgrange/bash_unit"
license=('GPL')
depends=('bash')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pgrange/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8515f5e030364ab7e1022d449087663bd93841b113e9a64a5bd8913e5358c53b')

package() {
  install -Dm755 ${pkgname}-${pkgver}/bash_unit "$pkgdir/usr/bin/bash_unit"
  install -dm755 ${pkgdir}/usr/share/man/man1
  cp -dpr --no-preserve=ownership ${pkgname}-${pkgver}/docs/man/man1/*.1 "$pkgdir/usr/share/man/man1"
}
