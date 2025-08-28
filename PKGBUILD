# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: n0vember <n0vember at half-9 dot net>

pkgname=bash_unit
pkgver=2.3.3
pkgrel=1
pkgdesc="bash unit testing enterprise edition framework for professionals"
arch=('any')
url="https://github.com/pgrange/bash_unit"
license=('GPL')
depends=('bash')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pgrange/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a2f76ddca88e2bef7c628c8cac6bf68b93a388fce143f6a4dc770fe1b3584307')

package() {
  install -Dm755 ${pkgname}-${pkgver}/bash_unit "$pkgdir/usr/bin/bash_unit"
  install -dm755 ${pkgdir}/usr/share/man/man1
  cp -dpr --no-preserve=ownership ${pkgname}-${pkgver}/docs/man/man1/*.1 "$pkgdir/usr/share/man/man1"
}
