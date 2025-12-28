#Maintainer: Popolon <popolon aL popolon d0t org>
# generated with  pip2pkgbuild
# modified by hand

pkgname='python-jupyterlite-pyodide-kernel'
_module='jupyterlite-pyodide-kernel'
_src_folder='jupyterlite_pyodide_kernel-0.7.0'
pkgver='0.7.0'
pkgrel=1
pkgdesc="Python kernel for JupyterLite powered by Pyodide"
url="None"
depends=('python' 'python-debugpy' 'jupyter-notebook-shim' 'python-rfc3339-validator' 'python-rfc3986-validator' 'jupyter-server' 'jupyter-lsp' 'jupyter-nbconvert' 'jupyter-server-mathjax' 'python-jupyter-events' 'python-jsonschema' 'python-isoduration' 'python-fqdn' 'python-webcolors' 'python-uri-template' 'python-rfc3987-syntax' 'python-bleach' 'python-tinycss2-1.4' 'python-tzdata' 'python-jsonpointer' 'python-ipywidgets' 'python-myst-parser' 'python-pydata-sphinx-theme' 'python-ruff')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pkginfo')
license=('custom:BSD License')
arch=('any')
source=("https://files.pythonhosted.org/packages/f2/26/6fe82895db3ad85e3ccf1ce7155f89ec910db8a8e3267dca54adba9fbbfa/jupyterlite_pyodide_kernel-0.7.0.tar.gz")
sha256sums=('4c2b6763518faf6d72eea91b2db31e215fbc9aa3099cc3cfa5a2866cbd1c380e')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
