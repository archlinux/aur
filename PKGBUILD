# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname='python-magic-ahupp'
_pkgname='python-magic'
pkgdesc='A python wrapper for libmagic'
pkgver=0.4.11
pkgrel=1
arch=('any')
url="https://github.com/ahupp/python-magic"
license=('GPL')
source=("https://pypi.python.org/packages/bb/03/1246519939004c60fc34c7bed9c0ab0e7d1b972b9278e5394bed942446a3/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('89021e288d6efd22cde2842349d79939b9664efdbf99f5790c9862a67759ea94')
conflicts=('python-magic')
provides=('python-magic')

package () {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}"
}
