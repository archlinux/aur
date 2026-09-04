# Maintainer: gonsolo@gmail.com
pkgname=yowasp-yosys
pkgver=0.68.0.0.post1208
pkgrel=1
pkgdesc="Yosys built for WebAssembly via YOWASP (installed from PyPI)"
arch=('any')
url="https://pypi.org/project/yowasp-yosys/"
license=('MIT')
depends=('python' 'wasmer')
makedepends=('python-pip' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/py3/y/yowasp-yosys/yowasp_yosys-${pkgver}-py3-none-any.whl")
noextract=("yowasp_yosys-${pkgver}-py3-none-any.whl")
sha256sums=('0552936b1482415512e39915a1c0f3ed1135151293440e266064f3f75e90d4a2')

package() {
  cd "${srcdir}"
  python -m installer --destdir="${pkgdir}" "yowasp_yosys-${pkgver}-py3-none-any.whl"
}

