# Maintainer: Sergi Jimenez <sjr@redhat.com>

pkgname=python2-kubernetes
_pkgname=kubernetes
pkgver=7.0.0
pkgrel=1
license=('Apache')
pkgdesc='Python client for the kubernetes API'
makedepends=('python2-setuptools')
depends=('python2'
         'python2-certifi'
         'python2-six'
         'python2-dateutil'
         'python2-urllib3'
         'python2-yaml'
         'python2-google-auth'
         'python2-ipaddress'
         'python2-websocket-client'
         'python2-requests'
         'python2-requests-oauthlib')
arch=('any')
url='https://github.com/kubernetes-client/python'
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('84dfb4319afac189e8327b71b9332b5329d2a78074f58958c5f06a870edf32ba')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
