# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=logcat-color
pkgver='0.6.0'
pkgrel=1
pkgdesc='A colorful alternative to "adb logcat"'
arch=('any')
url='https://github.com/marshall/logcat-color'
license=('Apache')
depends=('python2-colorama')
source=("https://pypi.python.org/packages/source/l/logcat-color/logcat-color-${pkgver}.tar.gz")

build() {
  cd "$srcdir/logcat-color-${pkgver}"
  python2 setup.py build
}

package() {
  cd "$srcdir/logcat-color-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

sha256sums=('ca66de3271f5b08fa267b25ad89b5d295ccc5d658f51e764d4f5753fc0d980cb')
