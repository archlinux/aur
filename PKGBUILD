# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-zxing-cpp-bin
_name=zxing_cpp
pkgver=3.0.0
pkgrel=1
pkgdesc="Python bindings for zxing-cpp"
arch=('x86_64')
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
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_27_${CARCH}.manylinux_2_28_${CARCH}.whl")
sha256sums=('489fc0ab4af893e1b10b58b70c34db80fbbaf6e5c27c216e8f3f2367cf18a45d')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
