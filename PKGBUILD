# Maintainer: Matthias Kaufmann <2b5e3ee5e375e17631bb6a2210deb78b[__at__]tfwno[__dot__]gf>
pkgname=python2-ntlm
_pyname=ntlm
pkgver=1.1.0
pkgrel=1
pkgdesc="Python library that provides NTLM support, including an authentication handler for urllib2"
url="https://pypi.python.org/pypi/python-ntlm"
arch=('any')
license=('unknown')
depends=('python2')
makedepends=('python2-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://pypi.python.org/packages/10/0e/e7d7e1653852fe440f0f66fa65d14dd21011d894690deafe4091258ea855/python-${_pyname}-${pkgver}.tar.gz)
md5sums=('c1b036401a29dd979ee56d48a2267686')

package() {
  cd python-${_pyname}-${pkgver}
  python2 setup.py install -O1 --root="$pkgdir/" --prefix=/usr
}
