# Maintainer: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=gns3-converter
pkgver=1.3.0
pkgrel=1
pkgdesc='GNS3 topology converter.'
arch=('any')
url='https://github.com/GNS3/gns3-converter'
license=('GPL3')
groups=('gns3')
makedepends=('python-setuptools')
depends=('python-configobj' 'python-cx_freeze')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GNS3/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('b7f01539dec3909e05d91fd43f9f74cd')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
