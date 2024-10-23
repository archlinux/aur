pkgname='python-scikit_learn_intelex'
_module='scikit-learn-intelex'
_src_folder='scikit_learn_intelex-2024.7.0'
pkgver='2024.7.0'
pkgrel=1
pkgdesc="Intel(R) Extension for Scikit-learn is a seamless way to speed up your Scikit-learn application."
url="https://github.com/intel/scikit-learn-intelex"
depends=('python' 'python-daal4py' 'python-scikit-learn')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:Apache Software License')
arch=('any')
source=("https://files.pythonhosted.org/packages/70/6f/87863804ef1a6ac9fca0778c234017d5179956f4fee77466dff200aaf35a/scikit_learn_intelex-2024.7.0-py312-none-manylinux1_x86_64.whl")
sha256sums=('40259b3ab8c9171b9e777c2bdbcf317489020d3252d80e6e514351e893e1bc7a')

package() {
    python -m installer --destdir="${pkgdir}" *.whl
}
