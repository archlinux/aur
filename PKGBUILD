# Maintainer: gonsolo@gmail.com
pkgname=yowasp-runtime
pkgver=1.77
pkgrel=1
pkgdesc="YOWASP runtime environment for executing WebAssembly modules"
arch=('any')
url="https://pypi.org/project/yowasp-runtime/"
license=('MIT')
depends=('python' 'wasmer')
makedepends=('python-pip' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/py3/y/yowasp-runtime/yowasp_runtime-${pkgver}-py3-none-any.whl")
noextract=("yowasp_runtime-${pkgver}-py3-none-any.whl")
sha256sums=('SKIP')  # Replace with actual checksum after download

package() {
  cd "${srcdir}"
  python -m installer --destdir="${pkgdir}" "yowasp_runtime-${pkgver}-py3-none-any.whl"
}

