# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=python-kubernetes
_pkgname=kubernetes
pkgver=9.0.0
pkgrel=1
license=('Apache')
pkgdesc='Python client for the kubernetes API'
makedepends=('python-setuptools')
depends=('python' 'python-certifi' 'python-six' 'python-dateutil' 'python-urllib3' 'python-yaml' 'python-google-auth' 'python-ipaddress' 'python-websocket-client' 'python-requests' 'python-requests-oauthlib' 'python-adal')
arch=('any')
url='https://github.com/kubernetes-client/python'
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a8b0aed55ba946faea660712595a52ae53a8854df773d96f47a63fa0c9d4e3bf')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
