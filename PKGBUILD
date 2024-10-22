pkgname='python-tbb'
_module='tbb'
_src_folder='tbb-2021.13.1'
pkgver='2021.13.1'
pkgrel=1
pkgdesc="Intel® oneAPI Threading Building Blocks (oneTBB)"
url="https://github.com/oneapi-src/oneTBB"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:Other/Proprietary License')
arch=('any')
source=("https://files.pythonhosted.org/packages/79/62/52e55f0045efa6b10a69edb306c9bfdf4ec7d59cf88906f4fd104482fbfa/tbb-2021.13.1-py2.py3-none-manylinux1_i686.whl")
sha256sums=('bb5bdea0c0e9e6ad0739e7a8796c2635ce9eccca86dd48c426cd8027ac70fb1d')

package() {
    python -m installer --destdir="${pkgdir}" *.whl
}
