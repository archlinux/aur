#Maintainer: Shiv Upadhyay <shivnupadhyay@gmail.com>
pkgname=python-qiskit-aer-gpu
_name=qiskit_aer_gpu
_py=cp39
pkgver=0.9.1
pkgrel=4
pkgdesc="A high performance simulator for quantum circuits that includes noise models"
arch=(x86_64)
license=(Apache)
url="https://github.com/Qiskit/qiskit-aer"
depends=(
  )
makedepends=(
    'python-setuptools'
    'cuda'
    'conan'
    'cmake'
    'python-scikit-build'
  )
conflicts=(python-qiskit-aer)
provides=(python-qiskit-aer)
source=(
  https://files.pythonhosted.org/packages/ae/a0/a07d1b6390fa1aa6907c026fcc3a08cf93c106dec7864407301e5a40da13/$_name-$pkgver-$_py-$_py-manylinux_2_12_x86_64.manylinux2010_x86_64.whl
)
sha256sums=(
  1419ccf6f7db1a53a30dff04ecd77dabe2d87788d64f2011ed2425d347768b83
)

package ()
{
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null python -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps $_name-$pkgver-$_py-$_py-manylinux_2_12_x86_64.manylinux2010_x86_64.whl
}


# vim: set ts=2 sw=2 et:

