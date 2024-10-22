pkgname='python-daal'
_module='daal'
_src_folder='daal-2024.7.0'
pkgver='2024.7.0'
pkgrel=1
pkgdesc="Intel® oneAPI Data Analytics Library"
url="https://www.intel.com/content/www/us/en/developer/tools/oneapi/onedal.html"
depends=('python' 'onetbb')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:Other/Proprietary License')
arch=('any')
source=("https://files.pythonhosted.org/packages/17/5c/49bb24be8b8ee7ac1416bcc53a5c232c94b535b96824f3916cfdbb7069ea/daal-2024.7.0-py2.py3-none-manylinux1_x86_64.whl")
sha256sums=('4bcc7a2a4bd24eb9e1ae39a35839b226ecff681c22380d769d187a6f69587691')

package() {
    python -m installer --destdir="${pkgdir}" *.whl
}
