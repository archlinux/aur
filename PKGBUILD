# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pywerview
_pypiname=pywerview
#_pypidir="8b/ca/fc13415e41427f5bc925ccbe80361af2bdf4c6f21c9683e28c12d0703f72"
pkgver=0.2.0
pkgrel=2
pkgdesc="A (partial) Python rewriting of PowerSploit's PowerView.(Python3 fork)"
url="https://github.com/mpgn/pywerview"
arch=('any')
license=('GPLv3')
depends=('python' 'impacket' 'python-pyopenssl' 'python-pyasn1' 'python-pycryptodome'
'python-pyopenssl' 'python-beautifulsoup4')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/mpgn/pywerview/archive/v${pkgver}.tar.gz")

sha256sums=('2ea4a8f6d4c3858f88b352cb8d1d3a4962abc3f829b3789eedf9c455fc36898a')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
