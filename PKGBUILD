# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-zxing-cpp-bin
_name=zxing_cpp
pkgver=2.2.0
pkgrel=1
pkgdesc="Python bindings for zxing-cpp"
arch=('x86_64')
url="https://github.com/zxing-cpp/zxing-cpp"
license=('Apache-2.0')
depends=('python' 'zxing-cpp')
makedepends=('python-installer' 'python-wheel')
provides=('python-zxing-cpp')
conflicts=('python-zxing-cpp')
_py=cp311
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_${CARCH}.manylinux2014_x86_64.whl")
sha256sums=('8602d7cad833007df497b8db7c1216fc7d21e077eb02206b45f4fc061b082913')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
