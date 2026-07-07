# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-zxing-cpp-bin
_name=zxing_cpp
pkgver=3.1.0
pkgrel=1
pkgdesc="Python bindings for zxing-cpp"
arch=('x86_64' 'aarch64')
url="https://github.com/zxing-cpp/zxing-cpp"
license=('Apache-2.0')
depends=(
  'python'
  'zxing-cpp'
)
makedepends=(
  'python-installer'
  'python-wheel'
)
provides=('python-zxing-cpp')
conflicts=('python-zxing-cpp')
_py=cp314
source_x86_64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name}-$pkgver-$_py-${_py}t-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name}-$pkgver-$_py-${_py}t-manylinux_2_26_aarch64.manylinux_2_28_aarch64.whl")
sha256sums_x86_64=('1ec38090a9265753fb4a1f481cc0fa0e8d442f85618b3a450c9529fd6c4d848b')
sha256sums_aarch64=('c8535ad4e24fbd58ca8d30ecd0c89dabc671482ca14db2fc9ac763a22379f3bd')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
