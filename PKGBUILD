# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com>

pkgname=python2-gtts
_pypiname=gTTS
pkgver=1.0.2
pkgrel=1
pkgdesc="A Python interface to Google's Text to Speech API."
arch=('any')
url="https://github.com/pndurette/gTTS"
license=('MIT')
depends=('python2')
conflics=('python2-gtts-git')
makedepends=('python2' 'python2-setuptools')
provides=('python2-gtts')
source=("https://pypi.python.org/packages/source/g/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('16542c1b148c3c2ed30d7c9b8d29efbf')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}