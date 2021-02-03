#Maintainer: Shiv Upadhyay <shivnupadhyay@gmail.com>
pkgname=python-qiskit-aer-gpu
_name=qiskit_aer_gpu
_py=cp39
pkgver=0.7.3
pkgrel=1
pkgdesc="A high performance simulator for quantum circuits that includes noise models"
arch=(x86_64)
license=(Apache)
url="https://github.com/nschloe/quadpy"
depends=(
  )
makedepends=(
    'python-setuptools'
    'cuda'
    'conan'
    'cmake'
    'python-scikit-build'
  )
replaces=()
conflicts=(python-qiskit-aer)
provides=(python-qiskit-aer)
source=(
  https://files.pythonhosted.org/packages/e5/b5/870edc00e407e488ccb3bcba95c561302feb75b4e3457de273e59e44f9c4/$_name-$pkgver-$_py-$_py-manylinux2010_x86_64.whl
)
sha256sums=(
  518129d5c11698f4394e30e66e9aebda2e953a510aa70d804c34626ab594aa49
)
md5sums=(
)
validpgpkeys=()

package ()
{
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null python -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps $_name-$pkgver-$_py-$_py-manylinux2010_x86_64.whl
}


# vim: set ts=2 sw=2 et:

