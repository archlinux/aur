# Maintainer: Pedro Gabriel (pedrogabriel@dcc.ufmg.br)
pkgname=m64py
pkgver=0.2.3
pkgrel=5
pkgdesc="QT5 front-end for Mupen64Plus in Python"
arch=("any")
url="http://m64py.sourceforge.net"
license=("GPL")
depends=(mupen64plus sdl2 python-pyqt5 desktop-file-utils libxkbcommon-x11)
makedepends=(python-distribute)
source=("http://downloads.sourceforge.net/m64py/m64py-${pkgver}.tar.gz")
md5sums=('170c980bb4266162cb61a931f529a8b2')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}/"
}
