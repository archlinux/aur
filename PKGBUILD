# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-lsassy
_pypiname=lsassy
pkgver=3.1.1
pkgrel=1
pkgdesc="Python library to remotely extract credentials on a set of hosts"
url="https://github.com/Hackndo/lsassy"
arch=('any')
license=('MIT')
depends=('python' 'impacket' 'python-netaddr' 'python-pypykatz')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/Hackndo/lsassy/archive/v${pkgver}.tar.gz")
sha256sums=('932b2445c639aa6bc7bc809290953a50d7afe6e5695730885ebf10cabe9361f3')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
