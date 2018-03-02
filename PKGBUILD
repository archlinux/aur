# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=python-kubernetes
_pkgname=kubernetes
pkgver=5.0.0
pkgrel=1
license=('Apache')
pkgdesc='Python client for the kubernetes API'
makedepends=('python-setuptools')
depends=('python' 'python-certifi' 'python-six' 'python-dateutil' 'python-urllib3' 'python-yaml' 'python-google-auth' 'python-ipaddress' 'python-websocket-client' 'python-requests' 'python-requests-oauthlib')
arch=('any')
url='https://github.com/kubernetes-client/python'
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f81f145882471a1dd9d23360e99bd77027f07744729ef2728af4af7130cd19fd')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
