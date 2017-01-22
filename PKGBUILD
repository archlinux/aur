# Maintainer: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=python2-gtts_token
_pypiname=gTTS-token
pkgver=1.1.1
pkgrel=1
pkgdesc="A python implementation of the token validation of Google Translate."
arch=('any')
url="https://github.com/boudewijn26/gTTS-token"
license=('MIT')
depends=('python2')
makedepends=('python2' 'python2-setuptools')
source=("https://pypi.io/packages/source/g/${_pypiname}/${_pypiname}-${pkgver}.zip")
md5sums=('39f56680d81c3d553ccc663f013a48f8')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
