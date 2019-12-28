# Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-somafm
pkgver=2.0.0rc1
pkgrel=1
pkgdesc="Mopidy extension for playing music from SomaFM"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
	'mopidy>=3.0'
	'python-requests>=2.0')
provides=('mopidy-somafm')
source=("https://github.com/AlexandrePTJ/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('6ab13330a109f9b05e36d00d8b69c4f5')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
