# Maintainer: Pedro Gabriel (pedrogabriel@dcc.ufmg.br)
# Contributor: cookiengineer
pkgname=m64py
pkgver=0.2.4
pkgrel=1
pkgdesc="QT5 front-end for Mupen64Plus in Python"
arch=("any")
url="https://github.com/mupen64plus"
license=("GPL")
depends=(mupen64plus sdl2 python-pyqt5 python-pysdl2 desktop-file-utils libxkbcommon-x11)
makedepends=(python-distribute)
source=("https://github.com/mupen64plus/mupen64plus-ui-python/releases/download/${pkgver}/m64py-${pkgver}.tar.gz")
md5sums=('5710db43f238ec4527634d69d9bacf0b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}/"
}
