# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-lsassy
_pypiname=lsassy
pkgver=2.1.5
pkgrel=1
pkgdesc="Python library to remotely extract credentials on a set of hosts"
url="https://github.com/Hackndo/lsassy"
arch=('any')
license=('MIT')
depends=('python' 'impacket' 'python-netaddr' 'python-pypykatz')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/Hackndo/lsassy/archive/v${pkgver}.tar.gz")
sha256sums=('a144321cbf8b56e4dcb701ab0a57c929240659aff6418a2f00002527b2264eb3')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
