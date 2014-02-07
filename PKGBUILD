# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Adrian Sampson <adrian@radbox.org>

python=python
name=musicbrainzngs

pkgname=$python-$name
pkgver=0.5
pkgrel=1
pkgdesc="bindings for the MusicBrainz NGS service"
url="http://python-musicbrainzngs.readthedocs.org/"
license="BSD"
arch=('any')
depends=('python')
source=(http://pypi.python.org/packages/source/m/$name/$name-$pkgver.tar.gz)
md5sums=('9e17a181af72d04a291c9a960bc73d44')

prepare() {
  cd $srcdir/$name-$pkgver
}

build() {
  cd $srcdir/$name-$pkgver
  $python setup.py build
}

package() {
  cd $srcdir/$name-$pkgver
  $python setup.py install --root=$pkgdir
}
