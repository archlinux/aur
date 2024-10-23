pkgname='python-scikit_learn_intelex'
_module='scikit-learn-intelex'
_src_folder='scikit_learn_intelex-2024.7.0'
pkgver='2024.7.0'
pkgrel=1
pkgdesc="Intel(R) Extension for Scikit-learn is a seamless way to speed up your Scikit-learn application."
url="https://github.com/intel/scikit-learn-intelex"
depends=('python' 'python-daal' 'python-scikit-learn')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:Apache Software License')
arch=('any')
source=("https://files.pythonhosted.org/packages/96/5e/15d4f900dd7772c19bad53e98c7204fbd5f504f6db369efb3b40376f50ac/scikit_learn_intelex-2024.7.0-py310-none-manylinux1_x86_64.whl")
sha256sums=('ed0838c8db6a2873a1415e94b39ef1e282e1a9d4eb625b31c6dca158d49d9cd4')

package() {
    python -m installer --destdir="${pkgdir}" scikit_learn_intelex-2024.7.0-py310-none-manylinux1_x86_64.whl
}
