# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=pacdef
pkgver=0.4.4
pkgrel=1
pkgdesc='A declarative manager of Arch packages'
url='https://github.com/steven-omaha/pacdef'
source=("${pkgname}.py::https://github.com/steven-omaha/${pkgname}/releases/download/v${pkgver}/${pkgname}.py")
arch=('any')
license=('GPL3')
depends=('python')
sha256sums=('fe8aeb12df4bb7d185f1bee1c4ca242bcaec14e1981407951d75a51ea62b7c40')

package() {
  sed -i -e "s/VERSION = 'unknown'/VERSION = '${pkgver}'/" pacdef.py
  install -Dm755 pacdef.py "${pkgdir}/usr/bin/pacdef"
}
