# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=python2-piston-mini-client
pkgver=0.7.5
pkgrel=1
pkgdesc="Library for writing clients for Django's Piston REST APIs (Python 2)"
arch=(any)
url="https://launchpad.net/piston-mini-client"
license=(GPL)
depends=(python2 python2-httplib2 python2-oauthlib)
makedepends=(python2-distribute)
options=(!emptydirs)
source=("https://launchpad.net/piston-mini-client/trunk/${pkgver}/+download/piston-mini-client-${pkgver}.tar.gz")
sha512sums=('53ef74ea885e2cf403236543797ab32c483f3751c6b22c21a68160d398ae04b1670e6709541676699854975541aeab32600c5ef1611bc59afa40db36037faa1d')

package() {
  cd "piston-mini-client-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
