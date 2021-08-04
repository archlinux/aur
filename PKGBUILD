# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=pacdef
pkgver=0.4.1
pkgrel=1
pkgdesc='A declarative manager of Arch packages'
url='https://github.com/steven-omaha/pacdef'
source=("${pkgname}.py::https://github.com/steven-omaha/${pkgname}/releases/download/v${pkgver}/${pkgname}.py")
arch=('any')
license=('GPL3')
depends=('python')
sha256sums=('e82fd02be99346a286a198de93f2c6437afe4b3f848cd039d32c02e84c3d3439')

package() {
  sed -i -e "s/VERSION = 'unknown'/VERSION = '${pkgver}'/" pacdef.py
  install -Dm755 pacdef.py "${pkgdir}/usr/bin/pacdef"
}
