# Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-somafm
pkgver=2.0.2
pkgrel=3
pkgdesc="Mopidy extension for playing music from SomaFM"
arch=('any')
url="https://github.com/AlexandrePTJ/mopidy-somafm"
license=('APACHE')
depends=(
	'mopidy>=3.0'
	'python-requests>=2.0')
provides=('mopidy-somafm')
source=("mopidy-somafm-${pkgver}.tar.gz::https://github.com/AlexandrePTJ/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('7328441b6eeead7804fe722bb849cd5e')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
