# Maintainer: ael-code

pkgbase='python-pydirl'
pkgname=('python-pydirl' 'python2-pydirl')
pkgver=0.3.1
pkgrel=1
pkgdesc="simple static webserver and directory listing"
arch=('any')
url="https://github.com/ael-code/pydirl"
license=('GPL3')
options=(!emptydirs)
makedepends=('python-setuptools' 'python2-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('24040519acce329c793f6bf5d1fd2242')
sha1sums=('151397d0fb5e2b44171bb4e846ee25477bddc2cc')
sha256sums=('66fe375e85c407fc3f61f595ede78c64a0131841dbfc94c8d26a920b2bfe6fec')

package_python-pydirl() {
    depends=('python'
             'python-gevent'
             'python-flask'
             'python-click'
             'python-zipstream'
             'python-flask-bootstrap')

    cd "$srcdir/pydirl-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
  }

package_python2-pydirl() {
    depends=('python2'
             'python2-gevent'
             'python2-flask'
             'python2-click'
             'python2-zipstream'
             'python2-flask-bootstrap')

    cd "$srcdir/pydirl-${pkgver}"
    python2 setup.py install --root="$pkgdir/" --optimize=1
  }

# vim:set ts=2 sw=2 et:
