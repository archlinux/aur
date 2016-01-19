# Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-somafm
pkgver=1.0.1
pkgrel=1
pkgdesc="Mopidy extension for playing music from SomaFM"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
	'mopidy>=1.1'
	'python2-pykka>=1.1'
	'python2-setuptools'
	'python2-requests>=2.0')
makedepends=('python2')
provides=('mopidy-somafm')
source=("https://github.com/AlexandrePTJ/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('34487180d2505926f1a7452153f22135')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
