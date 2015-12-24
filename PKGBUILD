# Maintainer: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=gns3-converter
pkgver=1.2.4
pkgrel=1
pkgdesc='GNS3 topology converter.'
arch=('any')
url='https://github.com/dlintott/gns3-converter'
license=('GPL3')
groups=('gns3')
makedepends=('python-setuptools')
depends=('python-configobj' 'python-cx_freeze')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dlintott/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('9189904912a7eca035bc88fdc58cbd91')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
