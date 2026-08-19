# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=nvidia-riva-client
pkgname=python-$_name
pkgver=2.27.0
pkgrel=1
pkgdesc='Python implementation of the Riva Client API.'
arch=('any')
url='https://github.com/nvidia-riva/python-clients'
license=('MIT')
depends=('python' 'python-grpcio' 'python-grpcio-tools' 'python-websockets' 'python-protobuf')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
noextract=("${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('a18b0fa274417455b4fe2db126a340b8e7bfd362de838e05cb64af37c23c7ef3')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
