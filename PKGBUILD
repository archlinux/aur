# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-zxing-cpp-bin
_name=zxing_cpp
pkgver=2.2.0
pkgrel=2
pkgdesc="Python bindings for zxing-cpp"
arch=('x86_64')
url="https://github.com/zxing-cpp/zxing-cpp"
license=('Apache-2.0')
depends=('python' 'zxing-cpp')
makedepends=('python-installer' 'python-wheel')
provides=('python-zxing-cpp')
conflicts=('python-zxing-cpp')
_py=cp312
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_${CARCH}.manylinux2014_x86_64.whl")
sha256sums=('c0b35274af536ac9091d446ba0f69840feba62525feddf24b7b8991d924d6543')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
