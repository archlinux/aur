# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

_pkgname=py-trello
pkgbase=python-py-trello
pkgname=('python-py-trello' 'python2-py-trello')
pkgver=0.13.0
pkgrel=3
pkgdesc='Python API wrapper around Trello API'
arch=('any')
url='https://github.com/sarumont/py-trello'
license=('BSD')
depends=('python-dateutil' 'python-requests' 'python-requests-oauthlib' 'python-pytz')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/sarumont/py-trello/archive/${pkgver}.tar.gz")
sha256sums=('3f3ce1949e736995b408e55b266c7135dc4286439db17e38c37dc38aaf30ce93')

package_python-py-trello() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize='1'
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_python2-py-trello() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize='1'
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
