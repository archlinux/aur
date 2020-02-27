# $Id$
# Maintainer: Damir Jelić <poljar@termina.org.uk>

pkgname=python-nio
_pypiname=matrix-nio
pkgver=0.9.0
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
sha512sums=('5570bd2431f4afc2431faf18402d431d410acd9b41202dcb9cd776ab4835f1a0dd53182ae890136cf2d74e0468bd84aad67f4e7e96a7fc3fdd5b53716aeb4d7a')

package_python-nio() {
  cd "$srcdir"/$_pypiname-$pkgver

  python setup.py install --root="${pkgdir}/" --optimize=1
}
