# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Oliver Harley <oliver.r.harley+aur (at) gmail.com>
_pkgname=Keras_Preprocessing
pkgname=python38-keras-preprocessing
pkgver=1.1.2
pkgrel=6
pkgdesc="Preprocessing module of the Keras deep learning library"
arch=('any')
url="https://pypi.org/project/Keras-Preprocessing/"
license=('MIT')
makedepends=('python38-setuptools')
depends=('python' 'python38-numpy')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('add82567c50c8bc648c14195bf544a5ce7c1f76761536956c3d2978970179ef3')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python3.8 setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python3.8 setup.py install --root="$pkgdir"/ --optimize=1
}
