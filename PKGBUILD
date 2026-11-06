# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=nvidia-riva-client
pkgname=python-$_name
pkgver=2.28.0
pkgrel=1
pkgdesc='Python implementation of the Riva Client API.'
arch=('any')
url='https://github.com/nvidia-riva/python-clients'
license=('MIT')
depends=('python' 'python-grpcio' 'python-grpcio-tools' 'python-websockets' 'python-protobuf')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
noextract=("${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('57fa2f4dd7004a70583ac8a794fa6b165bbe62a5d284a50c2d2b45f3cf4e4987')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
