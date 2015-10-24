# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com>

pkgname=python2-gtts
_pypiname=gTTS
pkgver=1.0.7
pkgrel=2
pkgdesc="A Python interface to Google's Text to Speech API."
arch=('any')
url="https://github.com/pndurette/gTTS"
license=('MIT')
depends=('python2')
conflics=('python2-gtts-git')
makedepends=('python2' 'python2-setuptools')
provides=('python2-gtts')
source=("https://pypi.python.org/packages/source/g/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('84ec56e4d87d8a6235f6ea31379b9e86')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}