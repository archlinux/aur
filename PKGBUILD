# Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=python2-ws4py
_pypiname=ws4py
pkgver=0.3.4
pkgrel=1
pkgdesc="WebSocket library for Python"
arch=('any')
url="https://github.com/Lawouach/WebSocket-for-Python"
license=('BSD')
depends=('python2')
makedepends=('python2')
optdepends=('python2-cherrypy: CherryPy server'
            'python2-gevent: gevent server'
            'python2-tornado: Tornado client')
conflicts=('python2-ws4py-git')
provides=('python2-ws4py')
source=("https://pypi.python.org/packages/source/w/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('6b47e33cbd13f5c134b04f2a44a480ad')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
