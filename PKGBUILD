# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=python-piston-mini-client
pkgver=0.7.5
pkgrel=1
pkgdesc="Library for writing clients for Django's Piston REST APIs (Python 3)"
arch=(any)
url="https://launchpad.net/piston-mini-client"
license=(GPL)
depends=(python python-httplib2 python-oauthlib)
makedepends=(python-distribute)
options=(!emptydirs)
source=("https://launchpad.net/piston-mini-client/trunk/${pkgver}/+download/piston-mini-client-${pkgver}.tar.gz")
sha512sums=('53ef74ea885e2cf403236543797ab32c483f3751c6b22c21a68160d398ae04b1670e6709541676699854975541aeab32600c5ef1611bc59afa40db36037faa1d')

package() {
  cd "piston-mini-client-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
