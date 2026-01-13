# Maintainer: gonsolo@gmail.com
pkgname=yowasp-yosys
pkgver=0.60.0.0.post1055
pkgrel=1
pkgdesc="Yosys built for WebAssembly via YOWASP (installed from PyPI)"
arch=('any')
url="https://pypi.org/project/yowasp-yosys/"
license=('MIT')
depends=('python' 'wasmer')
makedepends=('python-pip' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/py3/y/yowasp-yosys/yowasp_yosys-${pkgver}-py3-none-any.whl")
noextract=("yowasp_yosys-${pkgver}-py3-none-any.whl")
sha256sums=('90645bc9952a87096d913c2a64641426d1dd0699428f3bbb432fd16eb5075bbf')

package() {
  cd "${srcdir}"
  python -m installer --destdir="${pkgdir}" "yowasp_yosys-${pkgver}-py3-none-any.whl"
}

