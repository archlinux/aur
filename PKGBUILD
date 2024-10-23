pkgname='python-daal4py'
_module='daal4py'
_src_folder='daal4py-2024.7.0'
pkgver='2024.7.0'
pkgrel=1
pkgdesc="daal4py is a Convenient Python API to the Intel® oneAPI Data Analytics Library (oneDAL)"
url="https://github.com/IntelPython/daal4py"
depends=('python' 'python-daal')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:Apache Software License')
arch=('any')
source=("https://files.pythonhosted.org/packages/13/23/18911c0d28a8e76e547307debea87fab5f8b7bc4fd98e670a8d777221592/daal4py-2024.7.0-py312-none-manylinux1_x86_64.whl")
sha256sums=('1147a35ad2217dffda432e1e2b93bc52d9333a10efe84f1ea9c4eccb7403641a')

package() {
    python -m installer --destdir="${pkgdir}" *.whl
}
