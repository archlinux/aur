# Maintainer: robertfoster
_name=mediapipe
_py=cp312
pkgname=python-mediapipe-bin
pkgver=0.10.14
pkgrel=1
pkgdesc="A cross-platform, customizable ML solutions for live and streaming media"
arch=('x86_64')
url="https://github.com/google/mediapipe"
license=("Apache")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('absl-py'
  'python'
  'python-cycler'
  'python-dateutil'
  'python-fonttools'
  'python-kiwisolver'
  'python-matplotlib'
  'python-opencv'
  'python-pillow'
  'python-protobuf'
  'python-wheel'
)
makedepends=('python-installer' 'python-wheel')

source=("https://files.pythonhosted.org/packages/11/73/07c6dcbb322f86e2b8526e0073456dbdd2813d5351f772f882123c985fda/${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")

package() {
  python -m installer --destdir="$pkgdir" *.whl
}

sha256sums=('9b1e72d754cd9e1b4b88d80ec9ead2f1cbe8424b7f883d3bda53341b982a9f8b')
