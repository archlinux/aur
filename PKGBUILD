# Maintainer: plastik-flasche
pkgname=python-kotlin-jupyter-kernel
_name=kotlin-jupyter-kernel
pkgver=0.12.0.217
pkgrel=1
pkgdesc="Kotlin Kernel for Jupyter Notebooks"
arch=('x86_64')
url="https://github.com/Kotlin/kotlin-jupyter"
license=('Apache')
depends=('python' 'jupyter-notebook' 'java-environment' 'gradle')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('68a3cd5f1801fab5e46a683d0dd49d30ea7ee273849ab6205bc1738eca02fd75')

package() {
    cd "$srcdir"
    python -m installer --destdir="$pkgdir" "${_name//-/_}-$pkgver-py3-none-any.whl"
}

