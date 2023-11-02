# Maintainer: gilcu3
# Previous Maintainer: Ben Alex <ben.alex@acegi.com.au>

_pkgname=tflite-runtime
pkgname=python-$_pkgname
pkgver=2.14.0
pkgrel=2
pkgdesc='TensorFlow Lite Python bindings'
arch=('any')
url='https://www.tensorflow.org/lite/'
license=('Apache')
depends=('python-tensorflow')
makedepends=("python" "python-pip")


package() {
  pip install --no-deps --root=$pkgdir --no-warn-script-location $_pkgname==$pkgver
}
