# Maintainer: ael-code

pkgbase='python-pydirl'
pkgname=('python-pydirl' 'python2-pydirl')
pkgver=0.1.2
pkgrel=1
pkgdesc="quick file sharing solution"
arch=(any)
url="https://github.com/ael-code/pydirl"
license=('GPL3')
options=(!emptydirs)
makedepends=('python-setuptools' 'python2-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ae493eada022b33e2d0dc57eeceac3cd898441e434c835b30f4b94ba5db69109')

package_python-pydirl() {
    depends=('python-gevent'
             'python-flask'
             'python-click'
             'python-zipstream'
             'python-flask-bootstrap')

    cd "$srcdir/pydirl-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
  }

package_python2-pydirl() {
    depends=('python2-gevent'
             'python2-flask'
             'python2-click'
             'python2-zipstream'
             'python2-flask-bootstrap')

    cd "$srcdir/pydirl-${pkgver}"
    python2 setup.py install --root="$pkgdir/" --optimize=1
  }

# vim:set ts=2 sw=2 et:
