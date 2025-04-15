pkgname='python-daal'
_module='daal'
_src_folder='daal-2025.4.0'
pkgver='2025.4.0'
pkgrel=1
pkgdesc="Intel® oneAPI Data Analytics Library"
url="https://www.intel.com/content/www/us/en/developer/tools/oneapi/onedal.html"
depends=('python' 'onetbb')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:Other/Proprietary License')
arch=('any')
source=("https://files.pythonhosted.org/packages/7b/28/82cdee8350f7d370689affc1e4e418fa30b54d85b351a31c068a83bae2f1/daal-2025.4.0-py2.py3-none-manylinux_2_28_x86_64.whl")
sha256sums=('8a25bf1fe0af1991fc3983e3a6e83b4627edc3f06aa5c9bbf05654539f2fb868')

package() {
    python -m installer --destdir="${pkgdir}" daal-2025.4.0-py2.py3-none-manylinux_2_28_x86_64.whl
}
