# Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-beets
_pypiname=Mopidy-Beets
pkgver=1.0.3
pkgrel=1
pkgdesc="Mopidy extension for playing music from a Beets collection"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
	'mopidy>=0.16'
	'python2-pykka>=1.1'
	'python2-distribute'
	'python2-requests')
makedepends=('python2')
provides=('mopidy-beets')
source=("https://pypi.python.org/packages/source/M/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('8746d2cfac14947255062de7eae2c3f1')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
