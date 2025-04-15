pkgname='python-scikit-learn-intelex'
_module='scikit-learn-intelex'
_src_folder='scikit_learn_intelex-2025.4.0'
pkgver='2025.4.0'
pkgrel=1
pkgdesc="Intel(R) Extension for Scikit-learn is a seamless way to speed up your Scikit-learn application."
url="https://github.com/intel/scikit-learn-intelex"
depends=('python' 'python-scikit-learn' 'python-daal')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:Apache Software License')
arch=('any')
source=("https://files.pythonhosted.org/packages/a0/e4/08b05ecdc32177052a5902bf32141e5615dc846f47191abefcd2ddb7be0e/scikit_learn_intelex-2025.4.0-py313-none-manylinux_2_28_x86_64.whl")
sha256sums=('c162db4a4f8e98b06337d836e678bd47c2b0a700fede3ace8496926aa6a424b8')

package() {
    python -m installer --destdir="${pkgdir}" scikit_learn_intelex-2025.4.0-py313-none-manylinux_2_28_x86_64.whl
}

