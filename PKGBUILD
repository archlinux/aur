#Maintainer: Popolon <popolon aL popolon d0t org>
# generated with  pip2pkgbuild
# tuned by hand

pkgname='python-jupyterlite-p5-kernel'
_module='jupyterlite-p5-kernel'
_src_folder='jupyterlite_p5_kernel-0.3.0'
pkgver='0.3.0'
pkgrel=1
pkgdesc="None"
url="None"
depends=('python' 'python-rfc3339-validator' 'python-rfc3986-validator' 'jupyterlab' 'jupyter-server' 'jupyter-lsp' 'jupyter-nbconvert' 'python-tinycss2-1.4')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:BSD License')
arch=('any')
source=("https://files.pythonhosted.org/packages/6e/c5/e2d6f97f73cc368a802492a1e037950e56be11050e60ad62252669ec7343/jupyterlite_p5_kernel-0.3.0.tar.gz")
sha256sums=('293974231974eef8d08eed6083a9ab6f3f2a9f18bd35cf98d9262d2ab8570fc6')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
