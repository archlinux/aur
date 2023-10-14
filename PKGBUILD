# Maintainer: Eritque Arcus <eritque-arcus at eritque-arcus dot tech>

_name="ghidra-stubs"
pkgname="python-$_name-bin"
pkgver=10.4.1.0.4
pkgrel=1
pkgdesc="Generates '.pyi' type stubs for the entire Ghidra API"
arch=(any)
url="https://github.com/VDOO-Connected-Trust/ghidra-pyi-generator"
license=(Apache2)
depends=(python)
makedepends=(python-installer)
# in bin it is "ghidra_stubs"
source=(ghidra_stubs-$pkgver-py2.py3-none-any.whl::"$url/releases/download/v$pkgver/ghidra_stubs-$pkgver-py2.py3-none-any.whl")
sha256sums=('13296a8c6912f70a620bede176bd6b7f11822d817e59cdc6e689651e512571e9')

package(){
  python -m installer --destdir="$pkgdir" ghidra_stubs-$pkgver-py2.py3-none-any.whl
  # install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}