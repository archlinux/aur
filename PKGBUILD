# Maintainer: Marcin Kornat <rarvolt@gmail.com>
pkgname=python-tensorflow-gpu
_name=tensorflow-gpu
_py=cp36
pkgver=1.1.0
pkgrel=1
pkgdesc="TensorFlow helps the tensors flow"
arch=('x86_64')
url="https://www.tensorflow.org/"
license=('Apache')
depends=('python' 'nvidia-utils' 'cuda')
makedepends=('python-pip')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/28/83/48870b153418a34e6244c6480babad65f1a23aa77e53d1aea2cac647c08e/tensorflow_gpu-1.1.0-cp36-cp36m-manylinux1_x86_64.whl")
sha256sums=('707e2f5aad075a364840aa5ebbbf8b786bc1eecb40d3c32c72584192910068b3')

package() {
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}

# vim:set ts=2 sw=2 et:
