# Maintainer: Nalanyinyun
pkgname=python-velopack-bin
pkgver=1.2.161
pkgrel=1
pkgdesc="Python bindings for Velopack"
arch=('x86_64')
url="https://github.com/velopack/velopack"
license=('MIT')

depends=('python')
makedepends=('python-installer')

source=("https://files.pythonhosted.org/packages/33/df/70435739460cf633ccd0c541a3cc60962e3687b9851496b9f26eed8bfd9b/velopack-${pkgver}-cp38-abi3-manylinux_2_28_x86_64.whl")

sha256sums=('07d52ce91d04162f0a573c61937ed568c2df688d85e385f697c939131fabfd21')

package() {
    python -m installer --destdir="$pkgdir" *.whl
}
