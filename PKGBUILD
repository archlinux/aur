pkgbase='python-torch-fidelity'
pkgname=('python-torch-fidelity')
_module='torch-fidelity'
pkgver='0.3.0'
pkgrel=1
pkgdesc="High-fidelity performance metrics for generative models in PyTorch"
url="https://www.github.com/toshas/torch-fidelity"
depends=('python')
makedepends=('python-installer')
license=('unknown')
arch=('any')
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_module:0:1}/$_module/${_module//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('d01284825595feb7dc3eae3dc9a0d8ced02be764813a3483f109bc142b52a1d3')

package() {
    depends+=()
    cd "${srcdir}"
    python -m installer --destdir="$pkgdir" ./*.whl
}
