# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=pacdef
pkgver=0.4.2
pkgrel=1
pkgdesc='A declarative manager of Arch packages'
url='https://github.com/steven-omaha/pacdef'
source=("${pkgname}.py::https://github.com/steven-omaha/${pkgname}/releases/download/v${pkgver}/${pkgname}.py")
arch=('any')
license=('GPL3')
depends=('python')
sha256sums=('e0fe981a55c2733f181a852e0da0b38f97a038e8836b83a0208a3297747b8635')

package() {
  sed -i -e "s/VERSION = 'unknown'/VERSION = '${pkgver}'/" pacdef.py
  install -Dm755 pacdef.py "${pkgdir}/usr/bin/pacdef"
}
