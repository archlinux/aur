# Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-dirble
pkgver=1.1.0
pkgrel=1
pkgdesc="Mopidy extension for Dirble open radio directory"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
	'mopidy>=1.0'
	'python2-pykka>=1.1'
	'python2-setuptools'
	'python2-pycountry'
	'python2-requests')
makedepends=('python2')
provides=('mopidy-dirble')
source=("https://github.com/mopidy/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('d5d3287d0e1559f2198925b2a71a5e73')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
