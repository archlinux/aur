# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=pacdef
pkgver=0.4.5
pkgrel=1
pkgdesc='A declarative manager of Arch packages'
url='https://github.com/steven-omaha/pacdef'
source=("${pkgname}.py::https://github.com/steven-omaha/${pkgname}/releases/download/v${pkgver}/${pkgname}.py")
arch=('any')
license=('GPL3')
depends=('python')
sha256sums=('b2a6cbd5b44e2997ae4f75d0f67523a695cf1e56dc6a750082ea9cd1abafb072')

package() {
  sed -i -e "s/VERSION = 'unknown'/VERSION = '${pkgver}'/" pacdef.py
  install -Dm755 pacdef.py "${pkgdir}/usr/bin/pacdef"
}
