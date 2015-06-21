# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com>

pkgname=python2-wifileds
_pypiname=wifileds
pkgver=1.0.6
pkgrel=1
pkgdesc="Library for multiple WiFi LED vendors."
arch=('any')
url="https://github.com/joaquincasares/python-wifi-leds"
license=('MIT')
depends=('python2')
conflics=('python2-wifileds-git')
makedepends=('python2-setuptools')
provides=('python2-wifileds')
source=("https://pypi.python.org/packages/source/w/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('81ad137e9cf5085730a72eabe6c1abc4')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}