# Maintainer: Nalanyinyun
pkgname=python-velopack-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Python bindings for Velopack"
arch=('x86_64')
url="https://github.com/velopack/velopack"
license=('MIT')
options=('!debug')

provides=('python-velopack')
conflicts=('python-velopack')

depends=('python')
makedepends=('python-installer')

source=("https://files.pythonhosted.org/packages/d7/42/ef12667e6a66ac9716c02c7dda80a246e614a5e5554ac22915b9bc024e59/velopack-${pkgver}-cp37-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")

sha256sums=('4fc0556b04c7a432199230cb207e87bb8287e0152a5f4cfd71fabc4e34884152')

package() {
    python -m installer --destdir="$pkgdir" *.whl
}