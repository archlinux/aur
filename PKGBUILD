# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=python-kubernetes
_pkgname=kubernetes
pkgver=10.0.1
pkgrel=1
license=('Apache')
pkgdesc='Python client for the kubernetes API'
makedepends=('python-setuptools')
depends=('python' 'python-certifi' 'python-six' 'python-dateutil' 'python-urllib3' 'python-yaml' 'python-google-auth' 'python-ipaddress' 'python-websocket-client' 'python-requests' 'python-requests-oauthlib' 'python-adal')
arch=('any')
url='https://github.com/kubernetes-client/python'
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('3770a496663396ad1def665eeadb947b3f45217a08b64b10c01a57e981ac8592')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
