# $Id$
# Maintainer: Damir Jelić <poljar@termina.org.uk>

pkgname=python-nio
_pypiname=matrix-nio
pkgver=0.8.0
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
         'python-cachetools' 'python-aiofiles')
source=("https://github.com/poljar/$_pypiname/archive/$pkgver.tar.gz")
sha512sums=('b49ba2f7822a630a8e9ec01fd846bab4eba406923e46025f4e2256ab34a2b8ab6856b4be2b8bdc14b7e565b490bdf1ced8eb1b4b40361cd4bc9f5dae44e0e567')

package_python-nio() {
  cd "$srcdir"/$_pypiname-$pkgver

  python setup.py install --root="${pkgdir}/" --optimize=1
}
