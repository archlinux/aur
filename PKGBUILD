# Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-dirble
pkgver=1.2.0
pkgrel=1
pkgdesc="Mopidy extension for Dirble open radio directory"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
	'mopidy>=1.0'
	'python2-pykka>=1.1'
	'python2-setuptools'
	'python2-requests')
makedepends=('python2')
provides=('mopidy-dirble')
source=("https://github.com/mopidy/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('136000b57f3716b9863e43d4d05812d7')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
