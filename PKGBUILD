pkgname='python-daal'
_module='daal'
_src_folder='daal-2025.0.0'
pkgver='2025.0.0'
pkgrel=1
pkgdesc="Intel® oneAPI Data Analytics Library"
url="https://www.intel.com/content/www/us/en/developer/tools/oneapi/onedal.html"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:Other/Proprietary License')
arch=('any')
source=("https://files.pythonhosted.org/packages/71/ff/d05ad9b627ac2d27efeb8d5f5aa03b9d288f86fa25ab01e597f405eca792/daal-2025.0.0-py2.py3-none-manylinux_2_28_x86_64.whl")
sha256sums=('f005480d73e2113b5002d9ec24f812ef895e4aa1f87b3797499b09eaa4335c9e')

package() {
    python -m installer --destdir="${pkgdir}" daal-2025.0.0-py2.py3-none-manylinux_2_28_x86_64.whl
}
