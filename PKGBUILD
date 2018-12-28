# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=python-kubernetes
_pkgname=kubernetes
pkgver=8.0.1
pkgrel=1
license=('Apache')
pkgdesc='Python client for the kubernetes API'
makedepends=('python-setuptools')
depends=('python' 'python-certifi' 'python-six' 'python-dateutil' 'python-urllib3' 'python-yaml' 'python-google-auth' 'python-ipaddress' 'python-websocket-client' 'python-requests' 'python-requests-oauthlib' 'python-adal')
arch=('any')
url='https://github.com/kubernetes-client/python'
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('25928c6067dd47fd45c2960ecc3199d901cd9faeb9ff511ba7eeced3ecf30a78')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
