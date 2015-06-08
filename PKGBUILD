# Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-alsamixer
pkgver=1.0.3
pkgrel=2
pkgdesc="Mopidy extension for ALSA volume control"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
	'mopidy>=0.19'
	'python2-pykka>=1.1'
	'python2-setuptools'
	'python2-pyalsaaudio')
makedepends=('python2')
source=("https://github.com/mopidy/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('1c8626f85615d2d3644e854dac8cce73')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
