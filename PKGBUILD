# Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-beets
pkgver=3.1.0
pkgrel=0
pkgdesc="Mopidy extension for playing music from a Beets collection"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
	'mopidy>=1.0'
	'python2-pykka>=1.1'
	'python2-setuptools'
	'python2-requests>=2.0')
makedepends=('python2')
provides=('mopidy-beets')
source=("https://github.com/mopidy/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('e79ee3aedf69ffda71b21a1da97de621')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
