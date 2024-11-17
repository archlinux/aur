pkgname='python-scikit-learn-intelex'
_module='scikit-learn-intelex'
_src_folder='scikit_learn_intelex-2025.0.0'
pkgver='2025.0.0'
pkgrel=1
pkgdesc="Intel(R) Extension for Scikit-learn is a seamless way to speed up your Scikit-learn application."
url="https://github.com/intel/scikit-learn-intelex"
depends=('python' 'python-scikit-learn' 'python-daal')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:Apache Software License')
arch=('any')
source=("https://files.pythonhosted.org/packages/8f/3f/97bf040b7207490e858cd6451b93b6cccc504eadc04bf019cd9d37b5f24e/scikit_learn_intelex-2025.0.0-py312-none-manylinux_2_28_x86_64.whl")
sha256sums=('339b191f735e78eac235e3d61a39c9f5706d39f7beb6cdffbecc34cd3e9fb65b')

package() {
    python -m installer --destdir="${pkgdir}" scikit_learn_intelex-2025.0.0-py312-none-manylinux_2_28_x86_64.whl
}

