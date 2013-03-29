# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Adrian Sampson <adrian@radbox.org>

python=python
name=musicbrainzngs

pkgname=$python-$name
pkgver=0.3
pkgrel=1
pkgdesc="bindings for the MusicBrainz NGS service"
depends=('python')
makedepends=('python-distribute')
arch=('any')
source=(http://pypi.python.org/packages/source/m/$name/$name-$pkgver.tar.gz)
md5sums=(2969c2c6e5c2bb244d7847c3f48d66dc)
url="https://github.com/alastair/python-musicbrainz-ngs"
license="BSD"

build() {
  cd $srcdir/$name-$pkgver
  $python setup.py build
}

package() {
  cd $srcdir/$name-$pkgver
  $python setup.py install --root=$pkgdir
}
