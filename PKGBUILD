# Maintainer: Andrew Steinke <rkcf@rkcf.me>

pkgname=python-arabic-reshaper
pkgrel=1
pkgver=2.0.14
pkgdesc="Reconstruct Arabic sentences to be used in applications that don't support Arabic"
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/mpcabd/python-arabic-reshaper"
license=('GPL3')
arch=('any')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('96c0bf23cbf5396f2bb8e564f4b90739')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
