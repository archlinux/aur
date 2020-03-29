# $Id$
# Maintainer: Damir Jelić <poljar@termina.org.uk>

pkgname=python-nio
_pypiname=matrix-nio
pkgver=0.10.0
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
sha512sums=('0e7248e1b4f9fcfddfc3e67042ef508e42343046bc4e2c10b6dab7ba5babb5473413c6bbb695f08219e96dd4ad606e410c2ccc4ffafdaa3d5c379b7b32a48c6a')

package_python-nio() {
  cd "$srcdir"/$_pypiname-$pkgver

  python setup.py install --root="${pkgdir}/" --optimize=1
}
