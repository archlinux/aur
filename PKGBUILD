# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python2-audioread
pkgver=2.1.4
pkgrel=1
pkgdesc="Python library for decoding audio files"
url="https://github.com/beetbox/audioread/"
depends=('python2')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/7a/d6/6d28473521ebf0b69174fbfdcca7e3ce46f6f9665af6c15bdfe880213076/audioread-2.1.4.tar.gz")
md5sums=('8151d336c48ee2bc03fbcba5840a3fe4')

build() {
  cd $srcdir/audioread-${pkgver}
  python2 setup.py build
}

package() {
  cd $srcdir/audioread-${pkgver}
  python2 setup.py install --root="$pkgdir" --optimize=1 
}
