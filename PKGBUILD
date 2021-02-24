pkgname=python-ursina
pkgver=3.4.0
pkgrel=1
pkgdesc='An easy to use game engine/framework for python.'
arch=('any')
url="https://pokepetter.github.io/ursina"
license=('BSD')
depends=('python-numpy'
                 'panda3d'
                 'python-pillow'
                 'python-screeninfo'
                 'python-pyperclip')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/51/7f/c0a354946bffb987f153b667e46fd7545059628753ad42bb8e8f5ce99fa3/ursina-3.4.0.tar.gz")
sha256sums=('a2b530d01edc4b0ce5a7f4581ef70bf04851a014cd4307baefbe1aa9aadc8a70')

package() {
  cd "ursina-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
