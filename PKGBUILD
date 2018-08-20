# Maintainer: n0vember <n0vember at half-9 dot net>
pkgname=bash_unit
pkgver=1.6.1
pkgrel=1
pkgdesc="bash unit testing enterprise edition framework for professionals"
arch=('any')
url="https://github.com/pgrange/bash_unit"
license=('GPL')
depends=('bash')
source=("https://github.com/pgrange/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')

package() {
  install -Dm755 -o root -g root ${pkgname}-${pkgver}/bash_unit "$pkgdir/usr/bin/bash_unit"
  install -dm755 ${pkgdir}/usr/share/man/man1
  cp -dpr --no-preserve=ownership ${pkgname}-${pkgver}/docs/man/man1/*.1 "$pkgdir/usr/share/man/man1"
}
