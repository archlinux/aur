# Maintainer: Tobias Roettger <toroettg@gmail.com>

pkgname=python-pytvdbapi
pkgver=0.5.0
pkgrel=2
pkgdesc="A clean, resource friendly and easy to use Python API for thetvdb.com"
arch=(any)
url="https://github.com/fuzzycode/pytvdbapi"
license=('LGPL3')
depends=('python' 'python-httplib2')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/pytvdbapi/pytvdbapi-$pkgver.tar.gz")
md5sums=('0c603d02270f957d9e3887c27854d2d5')

package() {
  cd "$srcdir/pytvdbapi-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:


