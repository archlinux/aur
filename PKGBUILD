# Maintainer: ael-code

pkgbase='python-pydirl'
pkgname=('python-pydirl' 'python2-pydirl')
pkgver=0.3
pkgrel=1
pkgdesc="simple static webserver and directory listing"
arch=(any)
url="https://github.com/ael-code/pydirl"
license=('GPL3')
options=(!emptydirs)
makedepends=('python-setuptools' 'python2-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('532fd35b539cb1ddbae29fbc1a660fc0')
sha1sums=('7681db3e2cd00497fdc719fdf09f7482404d6330')
sha256sums=('5d423927ca2b2d7219a4cd00a4cdd86a4e763e304edaf5a77f2553cecb48ae01')

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
