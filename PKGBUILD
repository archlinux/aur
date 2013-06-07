# Maintainer: <thomas t-8ch de>

pkgname=logcat-color
pkgver='0.5'
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

sha256sums=('d9f85101b3809708595941c670dc20ff4cbbff25fb782093d8825f114a7ccc2b')
