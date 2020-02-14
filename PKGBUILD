# $Id$
# Maintainer: Damir Jelić <poljar@termina.org.uk>

pkgname=python-nio
_pypiname=matrix-nio
pkgver=0.7.2
pkgrel=1
pkgdesc='python no-IO library for the matrix chat protocol'
arch=('any')
url='https://github.com/poljar/matrix-nio'
license=('ISC')
makedepends=('python-setuptools')
checkdepends=()
depends=('python' 'python-olm' 'python-h11' 'python-h2'
         'python-jsonschema' 'python-logbook' 'python-attrs'
         'python-peewee' 'python-atomicwrites' 'python-future'
         'python-pycryptodome' 'python-unpaddedbase64' 'python-aiohttp'
         'python-cachetools')
source=("https://github.com/poljar/$_pypiname/archive/$pkgver.tar.gz")
sha512sums=('9ec233d7a83eb03cde5d81cec38e7a33eeaed427e9b7122118c110dc2f2e3dd65091a6d8de2e807f78083db9fc07dd8a847a5c28daaa54f85a24538d07ab6b9c')

package_python-nio() {
  cd "$srcdir"/$_pypiname-$pkgver

  python setup.py install --root="${pkgdir}/" --optimize=1
}
