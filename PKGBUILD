# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=python-kubernetes
_pkgname=client-python
pkgver=2.0.0
pkgrel=1
license=('Apache')
pkgdesc='Python client for the kubernetes API'
makedepends=('python-setuptools')
depends=('python' 'python-websocket-client' 'python-urllib3' 'python-six' 'python-dateutil' 'python-oauth2client' 'python-ipaddress' 'python-certifi')
arch=('any')
url='https://github.com/kubernetes-incubator/client-python'
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('12c3837c95e9e7237f1273712de6fbb4bec4172559e066a97f10edd281d0ad0c')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
