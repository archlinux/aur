# Maintainer: Andrew Steinke <rkcf@rkcf.me>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=python-pylint-celery
_pkgname=pylint-celery
pkgver=0.3
pkgrel=2
pkgdesc="pylint plugin for analyzing celery"
arch=('any')
url="https://github.com/landscapeio/pylint-celery"
license=('GPL2')
depends=('python-pylint-plugin-utils')
makedepends=('python-setuptools')
source=("$url/archive/$pkgver.tar.gz")
md5sums=('b33388b34935ce0ccb7ff02aec0911f0')

build() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
