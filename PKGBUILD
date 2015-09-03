# Maintainer: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=iouyap
pkgver=0.95
pkgrel=1
pkgdesc='Bridge IOU to UDP, TAP and Ethernet. GNS3 tool.'
arch=('i686' 'x86_64')
url='https://github.com/GNS3/iouyap'
license=('GPL3')
groups=('gns3')
makedepends=('iniparser')
depends=()
optdepends=()
md5sums=('bcb103e450be1ddc3c3f4c31119652a4')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GNS3/${pkgname}/archive/${pkgver}.tar.gz")

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
