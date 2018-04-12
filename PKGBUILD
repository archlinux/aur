# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=python-kubernetes
_pkgname=kubernetes
pkgver=6.0.0
pkgrel=1
license=('Apache')
pkgdesc='Python client for the kubernetes API'
makedepends=('python-setuptools')
depends=('python' 'python-certifi' 'python-six' 'python-dateutil' 'python-urllib3' 'python-yaml' 'python-google-auth' 'python-ipaddress' 'python-websocket-client' 'python-requests' 'python-requests-oauthlib')
arch=('any')
url='https://github.com/kubernetes-client/python'
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b370ab4abd925309db69a14a4723487948e9a83de60ca92782ec14992b741c89')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
