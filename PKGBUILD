# Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-somafm
pkgver=2.0.1
pkgrel=1
pkgdesc="Mopidy extension for playing music from SomaFM"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
	'mopidy>=3.0'
	'python-requests>=2.0')
provides=('mopidy-somafm')
source=("https://github.com/AlexandrePTJ/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('290f7e24bbe41931e566f3d680f1eb13')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
