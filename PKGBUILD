# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-flup
pkgver=1.0.3
pkgrel=8
pkgdesc="Random assortment of WSGI servers"
url="https://www.saddi.com/software/flup/"
license=('BSD')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools')
source=("https://pypi.io/packages/source/f/flup/flup-$pkgver.tar.gz")
sha512sums=('f165685b39a8539d29d48d0ad3c9c0495f428892b8935545a128730687c658a1e8b74a09c8084dd4a2490b1d26f1382b48c95ba43401171fd46876b068ba2f8e')

build() {
  cd flup-$pkgver
  python3.8 setup.py build
}

package_python38-flup() {
  cd flup-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
