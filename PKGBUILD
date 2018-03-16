# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=units-openexchangerates
pkgver=0.1.0
pkgrel=1
pkgdesc="GNU Units compatible currencies updater using openexchangerates.org's api"
arch=('any')
depends=('python')
makedepends=('')
url="https://github.com/doronbehar/units-openexchangerates"
license=('ISC')
options=(!emptydirs)
source=($pkgname::https://raw.githubusercontent.com/doronbehar/${pkgname}/master/units_cur)
sha256sums=('8b3c638c392615e8cd66b3ec16920c0d48e47519b41f5e370858ddf7070b3e38')

package() {
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
