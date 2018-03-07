# Maintainer: minus <minus@mnus.de>

pkgname=python-libevdev
pkgver=0.4
pkgrel=1
pkgdesc="Python wrapper for libevdev "
url="https://github.com/whot/python-libevdev"
license=('MIT')
source=("https://github.com/whot/python-libevdev/archive/$pkgver.tar.gz")
sha512sums=('499ba25b2209ac09a6d48e18b08c0ff4831af68a46c899b5781f007c9386aca89be33897612bfeb30c6520910f675d64ce9855c2f645696ae6640826f250efbc')
arch=('i686' 'x86_64')
depends=(
  'python'
  'libevdev'
)

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set et sw=2 sts=2:
