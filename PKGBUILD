# Maintainer: gonsolo@gmail.com
pkgname=yowasp-runtime
pkgver=1.96
pkgrel=1
pkgdesc="YOWASP runtime environment for executing WebAssembly modules"
arch=('any')
url="https://pypi.org/project/yowasp-runtime/"
license=('MIT')
depends=('python' 'wasmer')
makedepends=('python-pip' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/py3/y/yowasp-runtime/yowasp_runtime-${pkgver}-py3-none-any.whl")
noextract=("yowasp_runtime-${pkgver}-py3-none-any.whl")
sha256sums=('4ff456a4a6dff9d689c7feac9f68fb1492bed4cf873450d7b41259fa31645783')

package() {
  cd "${srcdir}"
  python -m installer --destdir="${pkgdir}" "yowasp_runtime-${pkgver}-py3-none-any.whl"
}

