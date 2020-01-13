# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: tembleking <tembleking at gmail dot com>

pkgname=python2-gpxpy
pkgver=1.3.5
pkgrel=1
pkgdesc="Python GPX (GPS eXchange format) parser"
arch=(any)
url="https://github.com/tkrajina/gpxpy"
license=('Apache')
depends=('python2' 'python2-lxml>=3.1.2')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://github.com/tkrajina/gpxpy/archive/v${pkgver}.tar.gz")

package() {
  cd "${srcdir}/gpxpy-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

md5sums=('1fca40f70bb5184c9453f4585131653a')
