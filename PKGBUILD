# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=python-speechrecognition
_pkgname=speech_recognition
pkgver=1.1.1
pkgrel=1
pkgdesc="Google-powered speech recognition for Python"
arch=('i686' 'x86_64')
url="https://github.com/Uberi/speech_recognition"
license=('MIT')
depends=('python')
source=(https://github.com/Uberi/speech_recognition/archive/1.1.1.tar.gz)
md5sums=('9abba0588c884a2b350a718d9c713a04')

build() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root=$pkgdir
}
