# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>, 0fflineuser <0fflineuser@cock.li>

pkgname=python-tf2onnx
_name="tf2onnx"
epoch=1
pkgver=1.16.1
pkgrel=4
pkgdesc='Convert TensorFlow models to ONNX'
arch=(any)
url='https://github.com/onnx/tensorflow-onnx'
license=(MIT)
depends=(python python-tensorflow python-numpy python-onnx python-requests python-six python-flatbuffers)
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-pytest python-graphviz python-parameterized python-yaml python-onnxruntime)
source=("$_name-$pkgver-py3-none-any.whl::https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('90fb5f62575896d47884d27dc313cfebff36b8783e1094335ad00824ce923a8a')

package() {
  python -m installer --prefix="/usr" --destdir="${pkgdir}" *.whl
}
