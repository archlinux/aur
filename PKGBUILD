# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: n0vember <n0vember at half-9 dot net>

pkgname=bash_unit
pkgver=2.3.1
pkgrel=1
pkgdesc="bash unit testing enterprise edition framework for professionals"
arch=('any')
url="https://github.com/pgrange/bash_unit"
license=('GPL')
depends=('bash')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pgrange/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('30aefc0a75196000680f0668b495f3f98c568eb06d9187eab1e9b2e07237802c')

package() {
  install -Dm755 ${pkgname}-${pkgver}/bash_unit "$pkgdir/usr/bin/bash_unit"
  install -dm755 ${pkgdir}/usr/share/man/man1
  cp -dpr --no-preserve=ownership ${pkgname}-${pkgver}/docs/man/man1/*.1 "$pkgdir/usr/share/man/man1"
}
