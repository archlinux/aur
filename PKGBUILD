# Maintainer: Zack Didcott

# Using wheel directly, as source tarball does not contain
# requirements.txt, causing build to fail.

pkgname=python-flaskwebgui
pkgver=1.1.3
pkgrel=1
pkgdesc="Create desktop applications with Flask/Django/FastAPI!"
url="https://github.com/ClimenteA/flaskwebgui"
depends=("python")
makedepends=("python-installer" "python-wheel")
license=("MIT")
arch=("any")
source=("https://files.pythonhosted.org/packages/f8/46/5c42c6f52c4d90f8afc1eb049fcc3e5f7dcc89f95781b32740069503b353/flaskwebgui-1.1.3-py3-none-any.whl")
b2sums=("34666d1938c679c7844a75739ba990ed58311edc89493886d38381532d93caf1cb321e2b02b8b738d1883a9f7f31e24dbed799bdb06101dcc0d360d04935b2a6")

package() {
    python -m installer --destdir="${pkgdir}" ${srcdir}/*.whl
}