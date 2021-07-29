# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=pacdef
pkgver=0.3.2
pkgrel=2
pkgdesc='A declarative manager of Arch packages'
url='https://github.com/steven-omaha/pacdef'
source=("${pkgname}.py::https://github.com/steven-omaha/${pkgname}/releases/download/v${pkgver}/${pkgname}.py")
arch=('any')
license=('GPL3')
depends=('python')
sha256sums=('7686c8478fb93d964073019e022dfc394e878b53793b25cf04961f6af91da52a')

package() {
  sed -i -e "s/VERSION = 'unknown'/VERSION = '${pkgver}'/" pacdef.py
  install -Dm755 pacdef.py "${pkgdir}/usr/bin/pacdef"
}
