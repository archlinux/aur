# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-mss
pkgver=4.0.3
pkgrel=1
pkgdesc="An ultra fast cross-platform multiple screenshots module in pure Python using ctypes"
arch=('any')
url=https://github.com/BoboTiG/python-mss#python-mss
license=('MIT')
depends=(python)
makedepends=(python-setuptools)
source=(https://github.com/BoboTiG/python-mss/archive/v${pkgver}.tar.gz)
sha256sums=('4186dabd3afa21bf258cdcc9d10f66ccc6ec422bbbc4e3e563e34fcbcca59568')

build() {
  cd "$srcdir/python-mss-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/python-mss-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
