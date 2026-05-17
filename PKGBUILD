pkgname=python312-platformdirs
pkgver=4.9.6
pkgrel=1
pkgdesc='Platform-specific directories for Python 3.12'
arch=('any')
url='https://github.com/platformdirs/platformdirs'
license=('MIT')
depends=('python312')
makedepends=('python312-installer')
source=("platformdirs-4.9.6-py3-none-any.whl::https://files.pythonhosted.org/packages/75/a6/a0a304dc33b49145b21f4808d763822111e67d1c3a32b524a1baf947b6e1/platformdirs-4.9.6-py3-none-any.whl")
sha256sums=('e61adb1d5e5cb3441b4b7710bea7e4c12250ca49439228cc1021c00dcfac0917')

package() {
  python3.12 -m installer --destdir="$pkgdir" "$srcdir/platformdirs-4.9.6-py3-none-any.whl"
}
