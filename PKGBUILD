# Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-somafm
pkgver=0.7.1
pkgrel=2
pkgdesc="Mopidy extension for playing music from SomaFM"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
	'mopidy>=0.18'
	'python2-pykka>=1.1'
	'python2-setuptools'
	'python2-requests>=2.0')
makedepends=('python2')
provides=('mopidy-somafm')
source=("https://github.com/AlexandrePTJ/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('e9c9b2eab0282ca93f81abd5f7c5bbae')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
